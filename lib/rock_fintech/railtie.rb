module RockFintech
  class Railtie < ::Rails::Railtie
    initializer "RockFintech.logger" do
      RockFintech.logger = Rails.logger
    end
  end
end
