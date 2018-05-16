# coding: utf-8
# 客户端

module RockFintech
  class Client

    attr_accessor :config

    def initialize(options_arg)
      options = Utils.symbolize_keys(options_arg)
      @config = {
        uri: options[:url],
        rft_token: options[:rft_token],
        rft_org: options[:rft_org],
        rft_key: options[:rft_key],
        rft_secret: options[:rft_secret],
        private_key: OpenSSL::PKey::RSA.new(options[:private_key]),
        public_key: OpenSSL::PKey::RSA.new(options[:public_key]),
      }

      # 自动 include api 下的模块
      recursive_include_api('RockFintech::Api')

      # 自动 include form 下的模块
      recursive_include_api('RockFintech::Form')
    end

    def verify_data?(data)
      Sign.verify(data, @config)
    end

    private

    def recursive_include_api(module_chain)
      modules = eval("#{module_chain}.constants").each{ |constant| eval("#{module_chain}::#{constant}").class.kind_of?(Module) }

      if modules.empty?
        self.class.send(:include, eval(module_chain))
      else
        modules.each{ |constant| recursive_include_api("#{module_chain}::#{constant}") }
      end
    end

  end
end
