# coding: utf-8
module RockFintech
  module Api
    module Batch
      module BatchCouponB

        # 存管账户批量红包发放
        #
        # @param notify_url [ String ] 回调地址
        # @param items [ Array ] 还款信息(此参数传入时必须用 to_json 转化)
        #         * :in_card_no [String] 转入方电子账号
        #         * :currency [String] 币种 156：人民币
        #         * :amount [String] 入账金额
        #         * :coupon_date [String] 日期 YYMMDD
        #         * :coupon_type [String] 业务类别 001-红包发放
        #         * :name [String] 持卡人姓名
        #         * :third_reserved [String] 第三方流水号
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #
        def batch_coupon_b(batch_no, batch_count, notify_url, items, remark='')
          service = 'batch_coupon_b'

          params = {
            batch_count: batch_count,
            batch_no: batch_no,
            notify_url: notify_url,
            items: items,
            custom: remark,
          }

          res = operate_post(:operate, service, params, Http::ErrorCode.batch_coupon_b, ['RD000000'])

          res
        end

      end
    end
  end
end
