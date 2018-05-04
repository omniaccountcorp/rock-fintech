# coding: utf-8
module RockFintech
  module Form
    module Money
      module SignTransferP
        # 转让方转让手续费签约
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #       * :out_serial_no [String] 流水号
        #       * :order_no [String] 订单编号
        #       * :order_id [String] 订单号
        #       * :url [String] 页面跳转 url
        #
        def sign_transfer_p(card_no, out_serial_no, amount, start_time, end_time, 
                            callback_url, success_url, fail_url, devise='000001', remark='')
          service = 'sign_transfer_p'

          params = {
            card_no: card_no,
            out_serial_no: out_serial_no,
            amount: amount,
            start_time: start_time,
            end_time: end_time,
            callback_url: callback_url,
            success_url: success_url,
            fail_url: fail_url,
            client: devise,
            custom: remark,
          }

          res = operate_post(:operate, service, params, Http::ErrorCode.sign_transfer_p, ['RD000000'])

          res
        end
      end
    end
  end
end
