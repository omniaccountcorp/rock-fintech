# coding: utf-8
module RockFintech
  module Api
    module Account
      module SetPasswordQuery
        # 电子账户余额查询
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #       * :card_no [String] 电子账号
        #       * :order_id [String] 订单号
        #       * :status[Integer] 1 已下单;2 超时关闭;3 完成
        #
        def set_password_query(order_id, devise='000001', remark='')
          service = 'set_password_query'

          params = {
            order_id: order_id,
            client: devise,
            custom: remark,
          }

          res = operate_post(:query, service, params, Http::ErrorCode.set_password_query, ['RD000000'])

          res
        end

      end # module SetPasswordQuery
    end
  end
end
