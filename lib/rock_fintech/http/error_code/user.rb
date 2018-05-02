# coding: utf-8
# 用户 API 错误相关
module RockFintech
  module Http
    module ErrorCode

      def create_account_form
        @_create_account ||= %w[RD000601 RD000602 RD000603 RD000604 RD000605 RD777777 RD10001]
      end

      def self.account_mobile
        @_account_mobile ||= ['RD000074']
      end

    end # module ErrorCode
  end
end
