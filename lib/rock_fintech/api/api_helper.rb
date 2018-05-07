# coding: utf-8
module RockFintech
  module Api
    module CommunicateResultHelper

      # 操作类的 api，统一返回处理
      #
      # @param request_type [Symbole] 操作类（:operate）/查询类(:query)
      # @param service [ String ] 上饶的服务
      # @param params [ Hash ] 参数
      # @param fail_codes [ Array ] 错误返回码
      # @param success_codes [ String ] 【业务】【明确的】正确返回码（而不是申请成功这类）
      #
      # @return [ Hash ] 结果集(见通用返回)
      #
      def operate_post(request_type, service, params, fail_codes, success_codes, version=Http::Request::VERSION)
        request = Http::Request.new(params, @config, service, version)
        response = request.post

        res = RockFintech::Utils.api_result(params, response)

        if :operate == request_type
          # 向服务器发送操作，超时类的都应该当 pending 处理
          if response.http_pending?
            RockFintech.logger.info "#{request.identifier} 最终返回的数据为：\n#{res}\n"
            return res
          end
        elsif :query == request_type
          # 查询类 api，http 没成功都返回 pending
          unless response.http_success?
            RockFintech.logger.info "#{request.identifier} 最终返回的数据为：\n#{res}\n"
            return res
          end
        else
          raise '未知的请求类型，请选择设置：操作类（:operate）/查询类(:query)'
        end

        # 确定的错误
        if fail_codes.include?(response.data[:code])
          res[:result] = 'F'
          RockFintech.logger.info "#{request.identifier} 最终返回的数据为：\n#{res}\n"
          return res
        end

        # 确定的成功返回码
        if success_codes.include?(response.data[:code])
          res[:result] = 'S'
        end

        RockFintech.logger.info "#{request.identifier} 最终返回的数据为：\n#{res}\n"

        res
      end

    end # CommunicateResultHelper
  end
end
