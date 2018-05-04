# coding: utf-8
module RockFintech
  module Form
    module SignAgainP
      # 签约累加
      #
      # @param card_no [String] 电子账户
      # @param out_serial_no [String] 流水号
      # @param origin_serial_no [String] 原签约流水号
      # @param interface_type [String] 签约类型
      # @param amount [Decimal] 最大签约金额
      # @param start_time [Time] 开始时间
      # @param end_time [Time] 结束时间
      # @param callback_url [String] 回调地址
      # @param success_url [String] 成功跳转地址
      # @param fail_url [String] 失败跳转地址
      # @param devise [ String ] 交易终端，默认手机 000001手机APP 000002网页 000003微信 000004柜面
      # @param remark [ String ] 备注，默认为空
      #
      # @return [ Hash ] 结果集
      #   * :result [String] "S"/"F"/"P"
      #   * :request_params [Hash] 请求参数
      #   * :response [Object] 请求返回对象
      #   * :code [String] 结果代码
      #   * :msg [String] 结果信息
      #   * :data: 具体业务返回信息
      #       * :out_serial_no [String] 流水号
      #       * :order_id [String] 订单号
      #       * :url [String] 页面跳转 url
      #
      def sign_again_p(card_no, out_serial_no, origin_serial_no, interface_type, amount, start_time, end_time, success_url, fail_url, callback_url, devise='000001', remark='')
        service = 'sign_again_p'

        params = {
          card_no: card_no,
          out_serial_no: out_serial_no,
          origin_serial_no: origin_serial_no,
          interface_type: interface_type,
          amount: amount,
          start_time: start_time,
          end_time: end_time,
          success_url: success_url,
          fail_url: fail_url,
          callback_url: callback_url,
          client: devise,
          custom: remark,
        }

        res = operate_post(:operate, service, params, Http::ErrorCode.sign_again_p, ['RD000000'])

        res
      end

    end #SignAgainP
  end
end
