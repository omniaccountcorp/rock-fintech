# coding: utf-8
module RockFintech
  module Form
    module Account
      module RechargeP
        # 绑定卡到电子账户充值
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #       * :order_no [String] 订单编号
        #       * :order_id [String] 订单号
        #       * :url [String] 页面跳转 url
        #
        def recharge_p(order_no, card_no, bind_card, currency, amount, fee,
                       cert_type, cert_no, name, mobile, callback_url,
                       auth_flag, auth_seq_id, user_bank_code, user_bank_name_en,
                       user_bank_name_cn, bank_province, bank_city,
                       success_url, fail_url, user_ip, devise='000001', remark='')
          service = 'recharge_p'

          params = {
            order_no: order_no,
            card_no: card_no,
            bind_card: bind_card,
            currency: currency,
            amount: amount,
            fee: fee,
            cert_type: cert_type,
            cert_no: cert_no,
            name: name,
            mobile: mobile,
            callback_url: callback_url,
            auth_flag: auth_flag,
            auth_seq_id: auth_seq_id,
            user_bank_code: user_bank_code,
            user_bank_name_en: user_bank_name_en,
            user_bank_name_cn: user_bank_name_cn,
            bank_province: bank_province,
            bank_city: bank_city,
            success_url: success_url,
            fail_url: fail_url,
            user_ip: user_ip,
            client: devise,
            custom: remark,
          }

          res = operate_post(:operate, service, params, Http::ErrorCode.recharge_p, ['RD000000'])

          res
        end
      end
    end
  end
end
