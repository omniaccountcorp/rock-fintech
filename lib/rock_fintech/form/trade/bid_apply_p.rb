# coding: utf-8
module RockFintech
  module Form
    module Trade
      module BidApplyP
        # 绑卡网关接口
        #
        # @param interest_date [ Time ] 起息日 YYYYMMDD
        # @param end_date [ Time ] 产品到期日 YYYYMMDD
        # @param transact_date [ Time ] 交易时间 YYYYMMDD
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #       * :order_id [String] 订单号
        #       * :url [String] 页面跳转 url
        #
        def bid_apply_p(card_no, flow_id, amount, asset_no, interest_date, interest_type, interest_day,
                        end_date, interest_rate, frozen_flag, use_bonus, bonus_amount, mobile, transact_date,
                        third_custom, success_url, fail_url, forget_pwd_url, callback_url,devise='000001', remark='')
          service = 'bid_apply_p'

          params = {
            card_no: card_no,
            out_serial_no: flow_id,
            amount: amount,
            asset_no: asset_no,
            interest_date: interest_date.strftime('%Y%m%d'),
            interest_type: interest_type,
            interest_day: interest_day,
            end_date: end_date.strftime('%Y%m%d'),
            interest_rate: interest_rate,
            frozen_flag: frozen_flag,
            use_bonus: use_bonus,
            bonus_amount: bonus_amount,
            transact_date: transact_date.strftime('%Y%m%d'),
            third_custom: third_custom,
            success_url: success_url,
            fail_url: fail_url,
            callback_url: callback_url,
            forget_pwd_url: forget_pwd_url,
            client: devise,
            custom: remark,
          }

          res = operate_post(:operate, service, params, Http::ErrorCode.bid_apply_p, ['RD000000'])

          res
        end

      end # module
    end
  end
end
