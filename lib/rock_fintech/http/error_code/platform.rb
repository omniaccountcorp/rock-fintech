# coding: utf-8

module RockFintech
  module Http
    module ErrorCode
      def money_dispatch
        @_money_dispatch ||= %w[RD000001 RD000005 RD000012 RD000017 RD000537]
      end

      def money_revoke
        @_money_revoke ||= %w[RD000004 RD000008]
      end
    end # module ErrorCode
  end
end
