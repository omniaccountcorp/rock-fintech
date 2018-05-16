# coding: utf-8
module RockFintech
  module Api
    module Query
      module MoneyQuery

        #  资金交易状态查询
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #       * :name [String] 姓名
        #       * :status [String] 订单状态，1（1 充值订单已接受（中间态）、2 发送三方支付通道（中间态）、3 支付通道发送请求失败 网络原因，接口开发原因，终态需要通知客户重新发起（中间态）、4 支付通道受理成功。等待通道异步回调（中间态）、5 支付通道处理成功。回调处理成功，准备记账（中间态）、6 记账失败 需要人为干预，已扣款人工调账，调账调用记账接口（中间态）、7 记账调账交易成功 终态（成功）、8 交易关闭 正常终态（成功）、9 交易关闭 限额预处理失败（失败）、0 三方处理返回失败（失败）、A 账户资金冻结失败（失败）、B 支付通道处理失败（失败）、C 主动对账,支付通道无响应（中间态），当订单状态为8时，为资金到账
        #       * :bind_card [Stroutg] 电子账户绑定卡号
        #       * :amount [Stroutg] 操作金额
        #       * :order_time [Stroutg] 下单时间
        #       * :error_code [Stroutg] 失败错误码
        #       * :error_msg [Stroutg] 失败错误信息
        #       * :remark [Stroutg] 备注
        #
        def money_query(order_id, devise='000001', remark='')


          service = 'money_query'

          params = {
            order_id: order_id,
            client: devise,
            custom: remark,
          }

          res = operate_post(:query, service, params, Http::ErrorCode.money_query, ['RD000000'])

          res
        end

      end
    end
  end
end
