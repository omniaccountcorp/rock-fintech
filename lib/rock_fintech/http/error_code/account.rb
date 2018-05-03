# coding: utf-8

module RockFintech
  module Http
    module ErrorCode

      def self.create_account_p
        @_create_account ||= %w[RD000601 RD000602 RD000603 RD000604 RD000605 RD777777 RD10001]
      end

      def self.set_password_p
        @_set_password ||= %w[RD1031303 RD1031304 RD10001 RD001034 RD000602 RD001024 RD9997
                              RD1031301 RD000603 RD000604 RD000605]
      end

      def self.bind_bank_card_p
        @_bind_bank_card ||= []
      end

      def self.account_balance
        @_account_balance ||= []
      end

    end # module ErrorCode
  end
end
