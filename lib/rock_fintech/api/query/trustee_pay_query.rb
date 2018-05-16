# coding: utf-8
module RockFintech
  module Api
    module Query
      module TrusteePayQuery

        #  查询受托支付签约详情
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #       * :card_no [String] 借款人电子账号
        #       * :warrant_card_no [String] 担保人电子账号
        #       * :asset_no [Integer] 标的编号,40
        #       * :borrow_card_no [String] 名义借款人电子账号
        #       * :debtor_card_no [String] 收款人电子账号
        #       * :amount	[Decimal] 借款金额
        #       * :asset_no [String] 标的号
        #       * :status	受托支付签约状态 [Integer] 0：普通标的 1：签约 2：未签约
        #
        def trustee_pay_query(card_no, devise='000001', remark='')

          service = 'trustee_pay_query'

          params = {
            card_no: card_no,
            client: devise,
            custom: remark,
          }

          res = operate_post(:query, service, params, Http::ErrorCode.trustee_pay_query, ['RD000000'])

          res
        end

      end
    end
  end
end
