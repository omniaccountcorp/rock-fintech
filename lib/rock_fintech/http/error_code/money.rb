# coding: utf-8
# 支付/提现 API 错误相关
module RockFintech
  module Http
    module ErrorCode

      def coupon_recharge
        @_coupon_recharge ||= []
      end

    end # module ErrorCode
  end
end
