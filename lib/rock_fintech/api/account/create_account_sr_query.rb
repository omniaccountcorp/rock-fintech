# coding: utf-8
module RockFintech
  module Api
    module Account
      # 开户结果查询接口
      #
      # @param order_id	[String] 订单号
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
      #       * :name	[String] 持卡人姓名
      #       * :card_no	[String] 电子账号
      #       * :cert_no	[String] 证件号
      #       * :order_id	[String] 订单号
      #       * :cert_type	[Integer] 证件类型
      #       * :customer_no	[String] 客户号
      #       * :serial_no	[String] 三方绑定编号
      #       * :bank_card_no	[String] 绑定银行卡号
      #       * :mobile	[String] 手机号
      #       * :bank_name	[String] 银行名称
      #       * :status	[Integer] 订单状态 1 下单（等待网关访问后提交） 2 处理中（客户已提交，正在处理）3 订单关闭 4 超时关闭(超时时间:5分钟)
      #       * :rsp_code	[String] 00 处理成功 01 查询渠道登记簿，未找到该渠道记录 02 查询机构登记簿，未找到该机构记录 03 渠道未关联支付通道 04 支付通道登记簿无此记录 05 该渠道不可操作此类账户 06 开户数量超限 07 交易密码不一致 08 平台预留手机号错误 09 绑卡数量超出限制 10 四要素鉴权失败
      #       * :account_type	[String] 账户类型，200201：普通电子账户
      #
      def create_account_sr_query(order_id, devise="000001", remark='')
        service = "create_account_sr_query"

        params = {
          order_id: order_id,
          client: devise,
          custom: remark,Time
        }

        res = operate_post(:operate, service, params, Http::ErrorCode.create_account_sr_query, ["RD000000"] )

        res
      end
    end
  end
end
