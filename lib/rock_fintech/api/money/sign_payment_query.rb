# coding: utf-8
module RockFintech
  module Api
    module Money
      module SignPaymentQuery

        # 放款手续费签约查询
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #       * :out_serial_no [String]	流水号
        #       * :card_no [String] 电子账户
        #       * :name	[String] 姓名
        #       * :sign_flag [String]	签约状态(having(签约),revoking(未签约))
        #       * :start_time	[Fixnum] 签约开始时间
        #       * :end_time	[Fixnum] 签约结束时间
        #       * :amount	[String] 金额
        #       * :sign_date [String] 签约日期
        #       * :sign_time	[:String] 签约时间
        #
        def sign_payment_query(card_no,
                        devise='000001', remark='')

          service = 'sign_payment_query'

          params = {
            card_no: card_no,
            client: devise,
            custom: remark,
          }

          res = operate_post(:query, service, params, Http::ErrorCode.sign_payment_query, ['RD000000'])

          res
        end

      end  ## module SignPaymentQuery
    end
  end
end
