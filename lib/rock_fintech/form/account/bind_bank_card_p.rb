# coding: utf-8
module RockFintech
  module Form
    module Account
      module BindBankCardP
        # 绑卡网关接口
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #       * :out_serial_no [String] 申请流水号
        #       * :order_id [String] 订单号
        #       * :url [String] 页面跳转 url
        #
        def bind_bank_card_p(card_type, flow_id,
                             success_url, fail_url, callback_url,
                             card_no, devise='000001', remark='')
          service = 'bind_bank_card_p'

          params = {
            card_type: card_type,
            out_serial_no: flow_id,
            success_url: success_url,
            fail_url: fail_url,
            callback_url: callback_url,
            card_no: card_no,
            client: devise,
            custom: remark,
          }

          res = operate_post(:operate, service, params, Http::ErrorCode.bind_bank_card_p, ['RD000000'])

          res
        end

      end # module
    end
  end
end
