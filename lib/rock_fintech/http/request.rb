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
        sign_str = Sign.sign(sign_body, @config)

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

        # 6. decode http response
        result_str = Encrypt::RSA.decrypt(http_response.body, @config[:private_key])
        res = Utils.symbolize_keys(JSON.parse(result_str))

        RockFintech.logger.info "#{identifier} 返回的数据为：\n#{res}\n"

        # 7. create response
        @response = RockFintech::Http::Response.new(service: @service,
                                                    flow_id: flow_id,
                                                    http_response: http_response,
                                                    raw_body: http_response.body,
                                                    data: res,
                                                    data_valid: Sign.verify(res, @config))
      end

      def flow_id
        @params[:out_serial_no] || @params[:serial_no] || @params[:order_no] || @params[:batch_no]
      end

      def identifier
        "[#{@service} - #{flow_id}] "
      end

    end # end of class
  end
end
