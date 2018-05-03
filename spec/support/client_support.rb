# coding: utf-8

require 'yaml'

module ClientSupport
  def client
    config = YAML.load_file(File.join(__dir__, 'config/config.yml'))

    config = RockFintech::Utils.symbolize_keys(config)

    @client ||= RockFintech::Client.new(config)
  end
end
