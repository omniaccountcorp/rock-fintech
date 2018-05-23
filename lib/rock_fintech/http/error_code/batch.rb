# coding: utf-8

module RockFintech
  module Http
    module ErrorCode

      def self.batch_payment_b
        @_batch_payment ||= %w[]
      end

      def self.batch_repayment_b
        @_batch_payment ||= %w[RD000195]
      end

      def self.batch_end_credit_b
        @_batch_payment ||= %w[]
      end

      def self.batch_coupon_b
        @_batch_coupon_b ||= %w[]
      end

      def batch_notify_resend_b
        @_batch_notify_resend_b ||= %w[]
      end
    end # module ErrorCode
  end
end
