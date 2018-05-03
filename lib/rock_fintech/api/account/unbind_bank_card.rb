# coding: utf-8
module RockFintech
  module Api
    module Account
      module UnbindBankCard
        # 解绑银行卡
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #       * :card_no [String] 电子账号
        #       * :name [String] 持卡人姓名
        #       * :sign_flag [String] 签约状态 0：未签约 1：已签约
        #       * :sign_date [String] 签约日期
        #       * :sign_time [String] 签约时间
        #       * :states [String] 解绑状态
        #       * :revoke_sign_date [String] 签约取消日期
        #       * :revoke_sign_time [String] 签约取消时间
        #
        def unbind_bank_card(card_no, bank_card_no, customer_no, flow_id, card_type,
                             devise='000001', remark='')
          service = 'unbind_bank_card'

          params = {
            serial_no: flow_id,
            customer_no: customer_no,
            card_no: card_no,
            bank_card_no: bank_card_no,
            card_type: card_type,
            client: devise,
            custom: remark,
          }

          res = operate_post(:operate, service, params, Http::ErrorCode.set_password_p, ['RD000000'])

          res
        end

      end # module
    end
  end
end
