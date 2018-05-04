# coding: utf-8
module RockFintech
  module Form
    module Trade
      module SignAutoBidP

        # 自动业务授权
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #
        def sign_auto_bid_p(card_no, amount, unit_amount, out_serial_no,
                            start_time, end_time, success_url,
                            fail_url, callback_url,
                            devise='000001', remark='')

          service = 'sign_auto_bid_p'

          params = {
            card_no: card_no,
            amount: amount,
            unit_amount: unit_amount,
            out_serial_no: out_serial_no,
            start_time: start_time,
            end_time: end_time,
            success_url: success_url,
            fail_url: fail_url,
            callback_url: callback_url,
            client: devise,
            custom: remark,
          }

          res = operate_post(:operate, service, params, Http::ErrorCode::Trade.sign_auto_bid_p, ['RD000000'])

          res
        end

      end
    end
  end
end
