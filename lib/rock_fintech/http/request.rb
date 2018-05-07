# coding: utf-8
module RockFintech
  module Http

    class Request
      SIGN_TYPE = 'MD5'
      ENCODE = 'UTF-8'
      VERSION = '2.0.0'

      def initialize(params, config, service, version=VERSION)
        @params = params
        @config = config
        @uri = @config[:uri]
        @service = service
        @version = version || VERSION
        @response = nil
      end

      def post
        RockFintech.logger.info "#{identifier} 请求内容为：\n#{@params}\n"
        # 1. api params

        # 2. sign
        sign_body = {
          service: @service,
          timestamp: Time.now.to_i,
          uuid: Utils.get_uuid,
          sign_type: SIGN_TYPE,
          encode: ENCODE,
          version: @version,
        }.merge(@params)
        sign_str = sign(sign_body)

        # 3. merge sign
        post_body = sign_body.merge({sign: sign_str})

        # 4. encrypt
        request_data = Encrypt::RSA.encrypt(post_body.to_json, @config[:public_key])

        # 5. send http request
        header = {
          'rft-key' => @config[:rft_key],
          'rft-token' => @config[:rft_token],
          'rft-org' => @config[:rft_org],
        }
        RockFintech.logger.info "#{identifier} 发送的报文为：\n#{request_data}\n"
        http_response = RestClient.post(@uri, request_data, header)
        RockFintech.logger.info "#{identifier} 返回的报文为：\n#{http_response.body.force_encoding('utf-8')}\n"

        res = decode_body(http_response.body)
        RockFintech.logger.info "#{identifier} 返回的数据为：\n#{res}\n"

        @response = RockFintech::Http::Response.new(service: @service,
                                                    flow_id: flow_id,
                                                    http_response: http_response,
                                                    raw_body: http_response.body,
                                                    data: res,
                                                    data_valid: verify_sign(res))
      end

      def flow_id
        if @params[:out_serial_no]
          @params[:out_serial_no]
        elsif @params[:serial_no]
          @param[serial_no]
        elsif @params[:order_no]
          @params[:order_no]
        else
          nil
        end
      end

      def identifier
        "[#{@service} - #{flow_id}] "
      end

      private

      def sign(data)
        serialize_str = serialize(data)
        Sign::MD5.sign(serialize_str, Sign::MD5.sign(@config[:rft_key], @config[:rft_secret]))
      end

      def serialize(data)
        data = Hash[data.sort] # key 按照 alphabet 排序

        data.each{ |k, v|
          if v.kind_of?(Hash)
            data[k] = serialize(v)
          elsif v.kind_of?(Array)
            if v[0].kind_of?(Hash)
              v.each_with_index{ |ele, index|
                v[index] = sign(ele)
              }
            else
              data[k] = v.join('&')
            end
          end
        }

        data.map{|k,v| "#{k}=#{v}"}.join('&')
      end

      def decode_body(body)
        result_str = Encrypt::RSA.decrypt(body, @config[:private_key])
        Utils.symbolize_keys(JSON.parse(result_str))
      end

      def verify_sign(body)
        sign_str = body.delete(:sign)
        sign(body) == sign_str
      end
    end # end of class
  end
end
