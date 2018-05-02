# coding: utf-8

module RockFintech
  module Api
    module Money
      module CouponRecharge

        # 营销账户充值
        #
        # @param flow_id [ String ] 交易流水号
        # @param amount [ Bigdecimal ] 金额，精确到分
        # @param client [ String ] 交易终端，默认手机 000001手机APP 000002网页 000003微信 000004柜面
        # @param remark [ String ] 备注，默认为空
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #       * :serial_no [String] 交易流水号
        #       * :amount [Nmuber] 金额
        #       * :order_no [String] 订单编号
        #       * :balance [Number] 操作后账户余额
        #
        def coupon_recharge(flow_id, amount, client, remark)
          service = 'coupon_recharge'
          post_path = '/deposit'

          params = {
            serial_no: flow_id,
            amount: amount,
            client: client,
            custom: remark,
            timestamp: Time.now.to_i,
          }

          res = operate_post(:operate, service, params, post_path, Http::ErrorCode.coupon_recharge, ['RD000000'])

          RockFintech.logger.info res

          res
        end

      end # module
    end
  end
end
