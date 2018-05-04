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
        #       * :batch_no [String] 批次号
        #       * :batch_count [String] 数量
        #       * :batch_date [String] 日期
        #       * :items [Array]
        #         * :result [String] 处理相应码('00': 成功, 其他为失败)
        #         * :message [String] 应答描述
        #         * :out_card_no [String] 扣款电子账号
        #         * :in_card_no [String] 转入电子账号
        #         * :assets_no [String] 标的编号
        #         * :serial_no [String] 投标申请流水号
        #         * :third_reserved [String] 第三方流水号
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
