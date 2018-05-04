# coding: utf-8
module RockFintech
  module Form
    module BuyCreditP
      # 投资人购买债权
      #
      # @param card_no_in	承接方电子账号,必填,(19)位数
      # @param flow_id	申请流水号,必填,用于交易的唯一性标识，需前台保证唯一性。(32)位数
      # @param origin_serial_no	原交易申请流水号,必填，(32)位数
      # @param card_no_out	转让方电子账号,必填,(19)位数
      # @param total_balance	总共可转让金额，由转让人在不超过总原投标份额内进行控制,必填,13位保留两位
      # @param amount	转让金额，转让份额。本次转让份额+累计已转让份额不能大于总共可转让份额,必填,13位保留两位
      # @param transfer_price	转让价格，购买转让份额所需要的金额,必填,13位保留两位
      # @param interest_date	起息日YYYYMMDD,必填,(8)位数
      # @param interest_rate	转让后预期年化收益率,必填,8位保留5位
      # @param fee_way	手续费扣费方式。必填,0：指定金额,(1)位数
      # @param fee	转让手续费，手续费扣款方式为0时生效，可为0；手续费从转让方收取,必填,13位保留两位
      # @param third_custom	第三方保留域，必填,第三方保留使用，原样返回,(100)位数
      # @param mobile	手机号（电子账户绑定手机号），必填,（11）位
      # @param success_url	成功跳转地址，256
      # @param fail_url	失败跳转地址，256
      # @param forget_pwd_url	忘记密码跳转链接，256
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
      #       * :out_serial_no [String] 流水号
      #       * :order_id [String] 订单号
      #       * :url [String] 页面跳转 url
      #
      def buy_credit_p(card_no_in, flow_id, origin_serial_no, card_no_out, total_balance, amount, transfer_price, interest_date, interest_rate, fee_way, fee, third_custom, mobile, success_url, fail_url, forget_pwd_url, callback_url, devise='000001', remark='')
        service = 'buy_credit_p'

        params = {
          card_no_in: card_no_in,
          out_serial_no: flow_id,
          origin_serial_no: origin_serial_no,
          card_no_out: card_no_out,
          total_balance: total_balance,
          amount: amount,
          transfer_price: transfer_price,
          interest_date: interest_date,
          interest_rate: interest_rate,
          fee_way: fee_way,
          fee: fee,
          third_custom: third_custom,
          mobile: mobile,
          success_url: success_url,
          fail_url: fail_url,
          forget_pwd_url: forget_pwd_url,
          callback_url: callback_url,
          client: devise,
          custom: remark,
        }

        res = operate_post(:operate, service, params, Http::ErrorCode.buy_credit_p, ['RD000000'])

        res
      end

    end #BuyCreditP
  end
end
