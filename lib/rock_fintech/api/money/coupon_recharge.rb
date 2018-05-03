# coding: utf-8
module RockFintech
  module Api
    module Money
      module CouponRecharge
        # 营销账户充值
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #       * :serial_no [String] 交易流水号
        #       * :order_no [String] 订单号
        #       * :amount [Number] 金额
        #       * :balance [Number] 操作后账户余额
        #
        def coupon_recharge(amount, serial_no, devise='000001', remark='')
          service = 'coupon_recharge'

          params = {
            amount: amount,
            serial_no: serial_no,
            client: devise,
            custom: remark,
          }

          res = operate_post(:operate, service, params, Http::ErrorCode.coupon_recharge, ['RD000000'])

          RockFintech.logger.info res

          res
        end

      end # module
    end
  end
end
