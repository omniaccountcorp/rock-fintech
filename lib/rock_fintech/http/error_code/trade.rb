# coding: utf-8

module RockFintech
  module Http
    module ErrorCode

      def self.sign_bid_query
        @_sign_bid_query ||= %w[]
      end

      def self.auto_bid_apply
        @_auto_bid_apply  ||= %w[]
      end

      def self.debt_query
        @_debt_query ||= %w[]
      end

      def self.buy_credit_p
        @_buy_credit_p ||= %w[]
      end

      def trustee_pay_p
        @_trustee_pay_p ||= %w[]
      end
    end # module ErrorCode
  end
end
