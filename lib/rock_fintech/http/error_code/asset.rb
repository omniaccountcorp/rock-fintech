# coding: utf-8

module RockFintech
  module Http
    module ErrorCode
      module Asset

        def self.assets_enroll
          @_assets_enroll ||= %w[RD000189 RD000191 RD000388 RD000391 RD000435 RD000537]
        end

        def self.assets_revoke
          @_assets_revoke ||= %w[RD000001 RD000005 RD000027 RD000439 RD000490 RD000537]
        end

        def self.asset_query
          @_assets_revoke ||= %w[]
        end
      end
    end # module ErrorCode
  end
end
