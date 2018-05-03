# coding: utf-8
module RockFintech
  module Api
    module Account
      # 网关自定义下单查询（查询内容：投标，签约，债转，受托支付申请)
      #
      # @param order_no	[String] 订单号
      # @param devise [String] 交易终端，默认手机 000001手机APP 000002网页 000003微信 000004柜面
      # @param remark [String] 备注，默认为空
      #
      # @return [Hash] 结果集
      #   * :result [String] "S"/"F"/"P"
      #   * :request_params [Hash] 请求参数
      #   * :response [Object] 请求返回对象
      #   * :code [String] 结果代码
      #   * :msg [String] 结果信息
      #   * :data: 具体业务返回信息
      #       * :card_no	[String] 电子账号
      #       * :order_id	[String] 订单号
      #       * :state	[Integer] 状态，1 已下单;2 超时关闭;3 完成
      #
      def gateway_query(order_no, devise="000001", remark='')
        service = "gateway_query"

        params = {
          order_no: order_no,
          client: devise,
          custom: remark,
        }

        res = operate_post(:operate, service, params, Http::ErrorCode.gateway_query, ["RD000000"] )

        res
      end
    end
  end
end
