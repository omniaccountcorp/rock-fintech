# coding: utf-8

module RockFintech
  module Http
    module ErrorCode
      def self.sign_again_p
        @_sign_again_p ||= %w[]
      end
    end # module ErrorCode
  end
end
