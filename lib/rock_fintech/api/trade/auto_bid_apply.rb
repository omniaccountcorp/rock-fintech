# coding: utf-8
module RockFintech
  module Api
    module Trade
      module AutoBidApply
        # P2P平台自动为投资人投标
        #
        # @param card_no	[String] 电子账号 ,必填，19
        # @param out_serial_no	[String] 申请流水号 ,必填，用于交易的唯一性标识,40
        # @param amount [Decimal] 投标金额 ,必填,13
        # @param use_bonus	[Integer] 是否使用红包 ,必填,0：不使用红包;1：使用红包，1
        # @param bonus_amount	Decimal] 抵扣红包金额 ,必填,两位小数,13
        # @param auth_code	[String] 签约交易流水号 ,必填,40
        # @param asset_no	[String] 标的编号 ,必填，40
        # @param interest_date	[Date] 起息日，YYYYMMDD,必填,8
        # @param interest_type	[Integer] 付息方式 ,必填 1：等额本息； 2：每月付息，到期还本，1
        # @param interest_day	[Integer] 利息每月支付日, 条件选填 ，DD ，付息方式为2时必填；,2
        # @param end_date	[Date] 产品到期日，YYYYMMDD,必填,8
        # @param interest_rate	Decimal] 预期年化收益率 ,必填,8
        # @param frozen_flag	[Integer] 是否冻结金额 ,必填，0：不冻结；1：冻结,1
        # @param frozen_no	[String] 冻结编号,选填
        # @param devise [ String ] 交易终端，默认手机 000001手机APP 000002网页 000003微信 000004柜面
        # @param remark [ String ] 备注，默认为空
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String]  结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #       * :out_serial_no	[String] 申请流水号,40
        #       * :card_no	[String] 电子账号,19
        #       * :name	[String] 姓名,60
        #       * :asset_no	[String] 标的编号,40
        #       * :bid_amount	[Decimal] 投标金额,13
        #       * :forcast_income	[Decimal] 预期收益,13
        #       * :buy_date	[Date] 投标日期,8
        #       * :state	[Integer] 记录状态,1：投标中 2：计息中 3：到期待返还 4：本息已返还,1
        #       * :auth_code	[Integer] 投标申请授权码,20
        #
        def auto_bid_apply(card_no, out_serial_no, amount, use_bonus, bonus_amount, auth_code, asset_no, interest_date, interest_type, interest_day, end_date, interest_rate, frozen_flag, frozen_no, devise="000001", remark='')
          service = "auto_bid_apply"

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

          res = operate_post(:operate, service, params, Http::ErrorCode.auto_bid_apply, ["RD000000"] )

          res
        end
      end #AutoBidApply
    end
  end
end
