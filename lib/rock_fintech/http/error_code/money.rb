# coding: utf-8

module RockFintech
  module Http
    module ErrorCode

      def self.bank_recharge
        @_bank_recharge ||= []
      end

      def self.recharge_p
        @_recharge_p ||= []
      end

      def self.withdraw_p
        @_withdraw_p ||= []
      end

      def self.coupon_recharge
        @_coupon_recharge ||= []
      end

    end # module ErrorCode
  end
end
