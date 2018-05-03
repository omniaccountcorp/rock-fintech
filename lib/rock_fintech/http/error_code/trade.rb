# coding: utf-8

module RockFintech
  module Http
      module ErrorCode
        module Trade

          def self.sign_auto_bid_p
            @_sign_auto_bid ||= %w[]
          end

          def self.auto_bid_apply
            @_sign_auto_bid ||= %w[]
          end

          def self.revoke_auto_bid
            @_revoke_auto_bid ||= %w[]
          end
        end
      end # module ErrorCode
  end
end
