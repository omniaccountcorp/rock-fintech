# coding: utf-8

module RockFintech
  module Http
    module ErrorCode

      def self.batch_query_payment_b
        @_batch_query_payment ||= %w[]
      end

      def self.batch_query_repayment_b
        @_batch_query_repayment ||= %w[]
      end

      def self.apply_bid_query
        @_apply_bid_query ||= %w[RD000094 RD000201 RD000210]
      end

      def self.batch_new_query_payment_b
        @_batch_new_query_payment ||= %w[]
      end

      def self.batch_new_query_repayment_b
        @_batch_new_query_repayment ||= %w[]
      end

      def self.buy_credit_query
        @_buy_credit_query ||= %w[]
      end

      def self.money_query
        @_money_query ||= %w[]
      end

      def self.cnaps_query
        @_cnaps_query ||= %w[]
      end

      def self.trustee_pay_query
        @_trustee_pay_query ||= %w[]
      end

      def self.batch_new_query_coupon_b
        @_batch_new_query_coupon_b || %w[]
      end
    end # module ErrorCode
  end
end
