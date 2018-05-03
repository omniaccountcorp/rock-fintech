# coding: utf-8
module RockFintech
  module Api
    module Batch
      module BatchPaymentB

        # 批量放款
        # @param items [ Array ] 放款信息
        #          * :out_card_no
        #          * :amount
        #          * :interest_amount
        #          * :in_card_no
        #          * :currency
        #          * :out_fee_mode
        #          * :out_fee_amount
        #          * :in_fee_mode
        #          * :in_fee_amount
        #          * :assets_no
        #          * :auth_code
        #          * :third_reserved
        #          * :serial_no
        #          * :notify_url
        #          * :reserved
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #
        def batch_payment_b(batch_count, batch_no, batch_type,
                            batch_date, items,
                            devise='000001', remark='')

          service = 'batch_payment_b'

          params = {
            batch_count: batch_count,
            batch_no: batch_no,
            batch_type: batch_type,
            batch_date: batch_date,
            items: items,
            client: devise,
            custom: remark,
          }

          res = operate_post(:operate, service, params, Http::ErrorCode::Batch.batch_payment_b, ['RD000000'])

          res
        end

      end
    end
  end
end
