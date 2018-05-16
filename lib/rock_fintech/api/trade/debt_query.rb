# coding: utf-8
module RockFintech
  module Api
    module Trade
      module DebtQuery
        # 标的投标详情
        #
        # @param card_no	[String] 电子账号
        # @param asset_no	[String] 标的编号
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
        #       * :asset_no	[String] 标的号
        #       * :asset_amount	[Decimal] 标的登记金额
        #       * :balanceDebt	[Decimal] 标的剩余可投金额
        #       * :flag	[Integer] 标的状态,0：空标 1：投标 2：流标 3：满标 4：已撤销
        #       * :card_no	[String] 投资人电子账户
        #       * :amount	[Decimal] 投标金额
        #       * :bid_amount	[Decimal] 待还金额
        #       * :time [Date] 投标时间
        #       * :auth_code	[String] 投标申请授权码
        #       * :serial_no	[String] 投标申请流水号
        #       * :bonus_amount	[Decimal] 红包抵扣金额
        #       * :flag	[Integer] 投标状态，1：投标中 3：计息中 4：本息已返还
        #
        def debt_query(card_no, asset_no, devise="000001", remark='')
          service = "debt_query"

          params = {
            card_no: card_no,
            asset_no: asset_no,
            client: devise,
            custom: remark,
          }

          res = operate_post(:operate, service, params, Http::ErrorCode.debt_query, ["RD000000"] )

          res
        end
      end #DebtQuery
    end
  end
end
