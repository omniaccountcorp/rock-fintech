# coding: utf-8

module RockFintech
  module Http
    module ErrorCode

      def self.create_account_p
        @_create_account ||= %w[RD000601 RD000602 RD000603 RD000604 RD000605 RD777777 RD10001]
      end

      def self.marketing_query
        @_marketing_query ||= %w[ ]
      end

      def self.account_credits
        @_account_credits ||= %w[RD000203 RD000537]
      end

      def self.account_transaction_query
        @_account_transaction_query ||= %w[]
      end

      def self.create_account_sr_query
        @_create_account_sr_query ||= %w[]
      end

      def self.gateway_query
        @_gateway_query ||= %w[]
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

      def self.find_account_by_mobile
        @_find_account_by_mobile ||= %w[T130016 T2600120]
      end

      def self.find_account_by_id
        @_find_account_by_id ||= %w[RD000061 RD000089 RD000060 RD000063]
      end

      def self.set_password_query
        @_set_password_query ||= %w[]
      end
    end # module ErrorCode
  end
end
