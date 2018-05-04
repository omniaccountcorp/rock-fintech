# coding: utf-8

module RockFintech
  module Http
    module ErrorCode
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
