# coding: utf-8
module RockFintech
  module Api
    module Account
      module AccountBalance
        # 电子账户余额查询
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #       * :card_no [String] 电子账号
        #       * :name [String] 持卡人姓名
        #       * :balance [String] 账户可用余额
        #       * :freBi [String] 账户冻结余额
        #       * :third_custom [String] 第三方保留域
        #
        def account_balance(card_no, customer_no, third_custom='', devise='000001', remark='')
          service = 'account_balance'

          params = {
            customer_no: customer_no,
            card_no: card_no,
            third_custom: third_custom,
            client: devise,
            custom: remark,
          }

          res = operate_post(:query, service, params, Http::ErrorCode.account_balance, ['RD000000'])

          res
        end

      end # module
    end
  end
end
