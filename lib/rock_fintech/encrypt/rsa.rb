# coding: utf-8
module RockFintech
  module Encrypt
    module RSA

      def self.encrypt(content, public_key)
        content_str = ''
        content.scan(/.{1,245}/).each{ |str|
          content_str += public_key.public_encrypt(str)
        }
        Base64.strict_encode64(content_str)
      end

      def self.decrypt(content, private_key)
        content_str = Base64.strict_decode64(content)

        result_str = ''
        count = content_str.length / 256
        count.times.each{ |i|
          str = content_str[256*i, 256]
          result_str += private_key.private_decrypt(str)
        }

        result_str
      end

    end
  end
end
