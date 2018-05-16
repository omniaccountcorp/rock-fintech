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

      def self.coupon_withdraw
        @_coupon_withdraw ||= []
      end

      def self.sign_borrower_p
        @_sign_borrower_p ||= []
      end

      def self.sign_transfer_p
        @_sign_transfer_p ||= []
      end
      
      def self.sign_payment_query
        @_sign_payment_query ||= []
      end
      
      def self.sign_repayment_query
        @_sign_repayment_query ||= []
      end

    end # module ErrorCode
  end
end
