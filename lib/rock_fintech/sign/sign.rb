# coding: utf-8
module RockFintech
  module Sign

    def self.sign(data, config)
      serialize_str = serialize(data)
      Sign::MD5.sign(serialize_str, Sign::MD5.sign(config[:rft_key], config[:rft_secret]))
    end # sign

    def self.verify(data, config)
      sign_str = data.delete(:sign)
      self.sign(data, config) == sign_str
    end # verify

    private

    def self.serialize(data)
      data = Hash[data.sort]     # key 按照 alphabet 排序

      data.each{ |k, v|
        if v.kind_of?(Hash)      # 如果是 hash 接着 serialize
          data[k] = serialize(v)
        elsif v.kind_of?(Array)
          if v[0].kind_of?(Hash) # 如果是 hash 数组对元素接着 serialize
            v.each_with_index{ |ele, index|
              ele.delete('sign')
              ele.delete(:sign)
              ele = Hash[ele.sort]
              v[index] = ele.map{|k,v| "#{k}=#{v}"}.join('&')
            }
            data[k] = v.join('&')
          else                   # 如果是普通元素数组
            data[k] = v.join('&')
          end
        end
      }
      data.map{|k,v| "#{k}=#{v}"}.join('&')
    end # serialize

  end
end
