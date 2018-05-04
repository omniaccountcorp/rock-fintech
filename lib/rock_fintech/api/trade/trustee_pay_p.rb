# coding: utf-8
module RockFintech
  module Api
    module Trade
      module TrusteePayP
        # 受托支付申请
        #
        # @param out_serial_no	申请流水号， 必填,(32)位数
        # @param card_no	借款人电子账号，必填,(6)位数
        # @param asset_no	标的编号，必填,(40)位数
        # @param cert_type	借款人证件类型，必填，借款人证件类型，15:身份证18位，(2)位数
        # @param cert_no	借款人证件号码，必填，(19)位数
        # @param in_card_no	收款方电子账号，必填,(19)位数
        # @param third_custom	第三方保留域，必填,第三方保留使用，原样返回,(100)位数
        # @param success_url	成功跳转地址，256
        # @param fail_url	失败跳转地址，256
        # @param callback_url	回调地址，256
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
        #       * :order_id	[String] 订单号
        #       * :url [String] 页面跳转 url

        def trustee_pay_p(out_serial_no, card_no, asset_no, cert_type, cert_no, in_card_no, third_custom, success_url, fail_url, callback_url, devise="000001", remark='')
          service = "trustee_pay_p"

          params = {
            out_serial_no: out_serial_no,
            card_no: card_no,
            asset_no: asset_no,
            cert_type: cert_type,
            cert_no: cert_no,
            in_card_no: in_card_no,
            third_custom: third_custom,
            success_url: success_url,
            fail_url: fail_url,
            callback_url: callback_url,
            client: devise,
            custom: remark,
          }

          res = operate_post(:operate, service, params, Http::ErrorCode.trustee_pay_p, ["RD000000"] )

          res
        end
      end #TrusteePayP
    end
  end
end
