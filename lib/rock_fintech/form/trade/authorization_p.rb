# coding: utf-8
module RockFintech
  module Form
    module Trade
      module AuthorizationP
        # 业务授权处理
        #
        # @param start_time [ Time ] 签约开始时间
        # @param end_time [ Time ] 签约结束时间
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #       * :order_no [String] 订单编号
        #       * :order_id [String] 订单号
        #       * :url [String] 页面跳转 url
        #
        def authorization_p(card_no, amount, unit_amount, out_serial_no,
                            start_time, end_time, success_url,
                            fail_url, callback_url,
                            devise='000001', remark='')
          service = 'authorization_p'

          params = {
            card_no: card_no,
            amount: amount,
            unit_amount: unit_amount,
            out_serial_no: out_serial_no,
            start_time: start_time.to_i,
            end_time: end_time.to_i,
            success_url: success_url,
            fail_url: fail_url,
            callback_url: callback_url,
            client: devise,
            custom: remark,
          }

          res = operate_post(:operate, service, params, Http::ErrorCode.authorization_p, ['RD000000'])

          res
        end

      end
    end
  end
end
