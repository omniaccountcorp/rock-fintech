# coding: utf-8
module RockFintech
  module Api
    module Account
      module SignBidQuery
        # 查询投资人自动投标签约状态
        #
        # @param card_no	[String] 订单号
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
        #       * :out_serial_no	[String] 交易流水号
        #       * :card_no	[String] 电子账号,19
        #       * :name	[String] 持卡人姓名,60
        #       * :sign_flag	[Integer] 签约状态,having：已签约；revoking：未签约,10
        #       * :sign_date	[Date] 签约/签约取消日期,8
        #       * :sign_time	[Time] 签约/签约取消时间,6

        def sign_bid_query(card_no, devise="000001", remark='')
          service = "sign_bid_query"

          params = {
            card_no: card_no,
            client: devise,
            custom: remark,
          }

          res = operate_post(:operate, service, params, Http::ErrorCode.sign_bid_query, ["RD000000"] )

          res
        end
      end #SignBidQuery
    end
  end
end
