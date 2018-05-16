# coding: utf-8
module RockFintech
  module Api
    module Money
      module SignRepaymentQuery

        # 标的单笔查询
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #       * :card_no [String] 电子账号
        #
        def sign_repayment_query(card_no,
                        devise='000001', remark='')

          service = 'sign_repayment_query'

          params = {
            card_no: card_no,
            client: devise,
            custom: remark,
          }

          res = operate_post(:query, service, params, Http::ErrorCode.sign_repayment_query, ['RD000000'])

          res
        end

      end  ## module SignRepaymentQuery
    end
  end
end
