# coding: utf-8
module RockFintech
  module Api
    module Query
      module BuyCreditQuery

        #  投资人购买债权查询
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #       * :in_card_no [String] 承接方电子账号
        #       * :in_name [String] 承接方姓名
        #       * :out_card_no [Stroutg] 转让方电子账号
        #       * :out_name [Stroutg] 转让方姓名
        #       * :amount [Stroutg] 转让金额
        #       * :transfer_price [Stroutg] 转让价格
        #       * :transfer_balance [Stroutg] 剩余可转让金额
        #       * :fee [Stroutg] 转让手续费
        #       * :income [Stroutg] 转让所得
        #       * :auth_code [Stroutg] 投标申请授权码
        #
        def buy_credit_query(in_card_no, out_serial_no,
                             devise='000001', remark='')

          service = 'buy_credit_query'

          params = {
            in_card_no: in_card_no,
            out_serial_no: out_serial_no,
            client: devise,
            custom: remark,
          }

          res = operate_post(:query, service, params, Http::ErrorCode.buy_credit_query, ['RD000000'])

          res
        end

      end
    end
  end
end
