# coding: utf-8
require "uri"
require "net/http"
require "json"
require "openssl"
require "base64"
require 'macaddr'
require 'byebug'
require 'logger'
require 'bigdecimal'
require 'bigdecimal/util'

require "rock_fintech/version"

require "rock_fintech/version"
require "rock_fintech/utils"
require "rock_fintech/extensions"
require "rock_fintech/sign/md5"
require "rock_fintech/encrypt/rsa"
require "rock_fintech/encrypt/aes"
require "rock_fintech/http/communicate"
require "rock_fintech/http/decode"
require "rock_fintech/http/response"

# 自动加载所有 api
Dir["#{File.dirname(__FILE__)}/reapal/api/**/*.rb"].each { |file| require file }
# 自动加载所有 form
Dir["#{File.dirname(__FILE__)}/reapal/form/**/*.rb"].each { |file| require file }

require "rock_fintech/client"

module RockFintech

  class << self
    def logger
      @logger ||= default_logger
    end

    def default_logger
      _logger = Logger.new(STDOUT)
      _logger.level = Logger::INFO
      _logger
    end

    def logger=(log)
      @logger = (log ? log : Logger.new('/dev/null'))
    end
  end

end

require 'rock_fintech/railtie' if defined?(::Rails)
