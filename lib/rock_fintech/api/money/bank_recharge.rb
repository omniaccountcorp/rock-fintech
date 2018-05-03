# coding: utf-8
module RockFintech
  module Api
    module Money
      module BankRecharge
        # 网关充值
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #       * :url [String] 支付 url
        #       * :order_no [String] 订单号
        #       * :amount [Number] 金额
        #
        def bank_recharge(card_no, bank_type, callback_url, customer_no, redirect_url,
                          product_name, product_detail, order_no, bank_name, bank_id_no, amount,
                          devise='000001', remark='')
          service = 'bank_recharge'

          params = {
            card_no: card_no,
            bank_type: bank_type,
            callback_url: callback_url,
            customer_no: customer_no,
            redirect_url: redirect_url,
            product_name: product_name,
            product_detail: product_detail,
            order_no: order_no,
            bank_name: bank_name,
            bank_id_no: bank_id_no,
            amount: amount,
            client: devise,
            custom: remark,
          }

          res = operate_post(:operate, service, params, Http::ErrorCode.bank_recharge, ['RD000000'])

          RockFintech.logger.info res

          res
        end

      end # module
    end
  end
end
