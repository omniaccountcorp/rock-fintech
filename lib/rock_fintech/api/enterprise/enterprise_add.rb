# coding: utf-8
module RockFintech
  module Api
    module Enterprise
      module EnterpriseAdd

        #  线下企业账户信息入库
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #       * :card_no [String] 电子账号
        #
        def enterprise_add(cert_no, name, mobile,
                           bind_card, card_no, customer_no,
                           serial_no, role_type,
                           devise='000001', remark='')


          service = 'enterprise_add'

          params = {
            cert_no: cert_no,
            name: name,
            mobile: mobile,
            bind_card: bind_card,
            card_no: card_no,
            customer_no: customer_no,
            serial_no: serial_no,
            role_type: role_type,
            client: devise,
            custom: remark,
          }

          res = operate_post(:operate, service, params, Http::ErrorCode.enterprise_add, ['RD000000'])

          res
        end

      end
    end
  end
end
