# coding: utf-8
module RockFintech
  module Api
    module Batch
      module BatchEndCreditB

        # 批量结束债权
        # @param items [ Array ] 还款信息
        #          * :out_card_no
        #          * :in_card_no
        #          * :assets_no
        #          * :auth_code
        #          * :serial_no
        #          * :third_reserved
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #
        def batch_end_credit_b(batch_count, batch_no, batch_type,
                              batch_date, items,
                              devise='000001', remark='')

          service = 'batch_end_credit_b'

          params = {
            batch_count: batch_count,
            batch_no: batch_no,
            batch_type: batch_type,
            batch_date: batch_date,
            items: items,
            client: devise,
            custom: remark,
          }

          res = operate_post(:operate, service, params, Http::ErrorCode::Batch.batch_end_credit_b, ['RD000000'])

          res
        end

      end
    end
  end
end
