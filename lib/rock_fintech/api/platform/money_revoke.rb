# coding: utf-8
module RockFintech
  module Api
    module Platform
      module MoneyRevoke
        # 红包发放撤销
        #
        # @param origin_timestamp	原交易时间，必填，8
        # @param origin_serial_no	原交易流水，必填，32
        # @param card_no	原转出电子账户，必填,19
        # @param card_no_in	原转入电子账户 ,必填,19
        # @param currency	币种，必填，156,3
        # @param amount	金额，必填,12
        # @param description_flag	是否使用交易描述，必填，1使用，0不使用，1
        # @param description	交易描述 , 条件选填,40
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
        #       * :card_no	[String] 原转出电子账户
        #       * :card_no_in	[String] 原转入电子账户
        #       * :currency	[Integer] 币种
        #       * :amount	[Decimal] 金额
        #
        def money_revoke(origin_timestamp, origin_serial_no, card_no, card_no_in, currency, amount, description_flag, description, devise="000001", remark='')
          service = "money_revoke"

          params = {
            origin_timestamp: origin_timestamp,
            origin_serial_no: origin_serial_no,
            card_no: card_no,
            card_no_in: card_no_in,
            currency: currency,
            amount: amount,
            description_flag: description_flag,
            description: description,
            client: devise,
            custom: remark,
          }

          res = operate_post(:operate, service, params, Http::ErrorCode.money_revoke, ["RD000000"] )

          res
        end
      end #MoneyRevoke
    end
  end
end
