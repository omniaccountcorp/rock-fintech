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

      def self.sign_auto_bid_p
        @_sign_auto_bid ||= %w[]
      end

      def self.auto_bid_apply
        @_auto_bid_apply ||= %w[]
      end

      def self.revoke_auto_bid
        @_revoke_auto_bid ||= %w[]
      end

      def self.bid_apply_p
        @_bid_apply_p ||= ['RD001025']
      end
    end # module ErrorCode
  end # module http
end # module rockfintech
