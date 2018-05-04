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
      
    end # module ErrorCode
  end
end
