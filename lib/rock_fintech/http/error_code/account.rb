# coding: utf-8

module RockFintech
  module Http
    module ErrorCode

      def self.create_account_p
        @_create_account ||= %w[RD000601 RD000602 RD000603 RD000604 RD000605 RD777777 RD10001]
      end

    end # module ErrorCode
  end
end
