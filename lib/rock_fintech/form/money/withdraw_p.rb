# coding: utf-8
module RockFintech
  module Form
    module Money
      module WithdrawP
        # 提现
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
        def withdraw_p(order_no, card_no, bank_name, bind_card, name, cert_no, cert_type,
                       mobile, amount, fee, callback_url, channel_flag, channel_code, union_bank_code,
                       open_bank_code, bank_name_en, bank_name_cn, bank_province, bank_city,
                       success_url, fail_url, devise='000001', remark='')
          service = 'recharge_p'

          params = {
            order_no: order_no,
            card_no: card_no,
            bank_name: bank_name,
            bind_card: bind_card,
            name: name,
            cert_no: cert_no,
            cert_type: cert_type,
            mobile: mobile,
            amount: amount,
            fee: fee,
            callback_url: callback_url,
            channel_flag: channel_flag,
            channel_code: channel_code,
            union_bank_code: union_bank_code,
            open_bank_code: open_bank_code,
            bank_name_en: bank_name_en,
            bank_name_cn: bank_name_cn,
            bank_province: bank_province,
            bank_city: bank_city,
            success_url: success_url,
            fail_url: fail_url,
            client: devise,
            custom: remark,
          }

          res = operate_post(:operate, service, params, Http::ErrorCode.withdraw_p, ['RD000000'])

          res
        end
      end
    end
  end
end
