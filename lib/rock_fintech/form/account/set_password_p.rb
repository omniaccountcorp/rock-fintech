# coding: utf-8
module RockFintech
  module Form
    module SetPasswordP
      # 重置密码
      #
      # @param flow_id [ String ] 申请流水号
      # @param customer_no [ String ] 客户号
      # @param card_no [ String ] 电子账户
      # @param success_url [ String ] 成功 url
      # @param fail_url [ String ] 失败 url
      # @param callback_url [String] 回调 url
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
      #       * :out_serial_no [String] 申请流水号
      #       * :order_id [String] 订单号
      #       * :url [String] 页面跳转 url
      #
      def set_password_p(flow_id, customer_no, card_no,
                         success_url, fail_url, callback_url,
                         devise='000001', remark='')
        service = 'set_password_p'

        params = {
          out_serial_no: flow_id,
          customer_no: customer_no,
          card_no: card_no,
          success_url: success_url,
          fail_url: fail_url,
          callback_url: callback_url,
          client: devise,
          custom: remark,
        }

        res = operate_post(:operate, service, params, Http::ErrorCode.set_password_p, ['RD000000'])

        res
      end

    end
  end
end
