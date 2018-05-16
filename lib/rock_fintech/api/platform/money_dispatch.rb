# coding: utf-8
module RockFintech
  module Api
    module Platform
      module MoneyDispatch
        # 红包发放
        #
        # @param card_no	转出电子账户 ,必填，红包账号,19
        # @param card_no_in	转入电子账户，必填,20
        # @param currency	币种 ,必填，156,3
        # @param amount	金额 ,必填，精确到分（元），12
        # @param description_flag	是否使用交易描述 ,必填，1使用，0不使用,1
        # @param description	交易描述 , 条件选填，该字段禁止使用”/“，40
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String]  结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #       * :card_no	[String] 转出账户
        #       * :serial_no	[String] 红包发放流水号
        #       * :card_no_in	[String] 转入账户
        #       * :currency	[Integer] 币种
        #       * :amount	[Decimal] 金额
        #
        def money_dispatch(card_no, card_no_in, currency, amount, description_flag, description, devise="000001", remark='')
          service = "money_dispatch"

          params = {
            card_no: card_no,
            card_no_in: card_no_in,
            currency: currency,
            amount: amount,
            description_flag: description_flag,
            description: description,
            client: devise,
            custom: remark,
          }

          res = operate_post(:operate, service, params, Http::ErrorCode.money_dispatch, ["RD000000"] )

          res
        end
      end #MoneyDispatch
    end
  end
end
