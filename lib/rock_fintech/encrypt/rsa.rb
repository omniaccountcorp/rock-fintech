# coding: utf-8
module RockFintech
  module Encrypt
    module RSA
      MAX_ENCRYPT_LENGTH = 245
      MAX_DECRYPT_LENGTH = 256

      def self.encrypt(content, public_key)
        content_str, encryt_str, offset, i = "", "", 0, 0

        bytes_array = content.unpack("C*")
        input_length = bytes_array.length
        while  input_length - offset > 0
          encryt_bytes = bytes_array[offset, MAX_ENCRYPT_LENGTH]
          encryt_str << public_key.public_encrypt(encryt_bytes.pack("C*"))
          offset = (i += 1) * MAX_ENCRYPT_LENGTH
        end
        Base64.strict_encode64(encryt_str)
      end

      def self.decrypt(content, private_key)
        result_str, decryt_bytes, offset, i = "", "", 0, 0

        content_str = Base64.strict_decode64(content)
        input_length = content_str.length
        while input_length - offset > 0
          decryt_bytes = content_str[offset, MAX_DECRYPT_LENGTH]
          result_str << private_key.private_decrypt(decryt_bytes)
          offset = (i += 1) * MAX_DECRYPT_LENGTH
        end
        result_str
      end

    end
  end
end
