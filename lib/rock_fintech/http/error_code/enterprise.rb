# coding: utf-8
module RockFintech
  module Http
    module ErrorCode

      def self.enterprise_add
        @_enterprise_add ||= %w[400 401 403 404 405 410 429 500 503]
      end

    end # module ErrorCode
  end
end
