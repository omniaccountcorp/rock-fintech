# coding: utf-8
module RockFintech
  module Api
    module Trade
      module AutoBidApply

        # 一键投标
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #       * :out_serial_no [String] 申请流水号
        #       * :card_no [String] 电子账号
        #       * :name [String] 持卡人姓名
        #       * :sign_flag [String] 签约状态 "having(已签约), revoking(已撤销)"
        #       * :sign_date [String] 签约日期
        #       * :sign_time [String] 签约时间
        #
        def auto_bid_apply(card_no, out_serial_no, amount,
                           use_bonus, bonus_amount, auth_code,
                           asset_no, interest_date, interest_type,
                           interest_day, end_date, interest_rate,
                           frozen_flag, frozen_no="",
                           devise='000001', remark='')

          service = 'auto_bid_apply'

          params = {
            card_no: card_no,
            out_serial_no: out_serial_no,
            amount: amount,
            use_bonus: use_bonus,
            bonus_amount: bonus_amount,
            auth_code: auth_code,
            asset_no: asset_no,
            interest_date: interest_date,
            interest_type: interest_type,
            interest_day: interest_day,
            end_date: end_date,
            interest_rate: interest_rate,
            frozen_flag: frozen_flag,
            frozen_no: frozen_no,
            client: devise,
            custom: remark,
          }

          res = operate_post(:operate, service, params, Http::ErrorCode::Trade.auto_bid_apply, ['RD000000'])

          res
        end

      end
    end
  end
end
