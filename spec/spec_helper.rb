require "bundler/setup"
require 'faker'
require "rock_fintech"
require "awesome_print"
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |file| require file }

Faker::Config.locale = 'zh-CN'

# RockFintech.logger = Logger.new('tmp/test.log')

require 'simplecov'
SimpleCov.start

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include ClientSupport
end
