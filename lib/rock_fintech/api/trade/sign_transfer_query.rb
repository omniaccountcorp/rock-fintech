# coding: utf-8
module RockFintech
  module Api
    module Trade
      module SignTransferQuery
        # 投资人自动债转签约状态查询
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
        #       * :out_serial_no [String] 流水号
        #       * :card_no	[String] 电子账号,19
        #       * :state [String] 签约状况(having:已签约；revoking：已撤销)
        #       * :sign_date [String] 签约日期,8
        #       * :sign_time [String] 签约时间,6
        #       * :third_custom [String] 第三方保留域
        #       * :amount [String] 签约最高金额，(13)位数保留2位
        #       * :unit_amount [String] 单笔签约最高金额
        #       * :start_time [Fixnum] 签约开始时间
        #       * :end_time [Fixnum] 签约结束时间
        #       * :service [Object] 交易代码
        #

        def sign_transfer_query(card_no, devise="000001", remark='')
          service = "sign_transfer_query"

          params = {
            card_no: card_no,
            client: devise,
            custom: remark,
          }

          res = operate_post(:operate, service, params, Http::ErrorCode.sign_transfer_query, ["RD000000"] )

          res
        end
      end #SignTransferQuery
    end
  end
end

        #      => "2018-05-09",
        #     :sign_time => "16:26:45",
        #  :third_custom => "",
        #        :amount => "100000.00",
        #   :unit_amount => "100000.00",
        #    :start_time => 1525854340,
        #      :end_time => 1589012740,
        #       :service => "sign_transfer_query",
        #   :sequence_id => "5435673822ec9107d088464c0cd07c50"