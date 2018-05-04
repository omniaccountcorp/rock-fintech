# coding: utf-8
module RockFintech
  module Api
    module Account
      module MarketingQuery
        # 营销户信息查询
        #
        # @param card_no [ String ] 电子账号
        # @param type [ Integer ] 营销户类型 1：服务费账户，2：红包户，3：其他
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
        #       * :card_no [String] 电子账号
        #       * :customer_no [String] 客户号
        #       * :name [String] 客户姓名
        #       * :cert_no [String] 客户证件
        #       * :date [Date] 开户日期
        #       * :balance [Decimal] 可用余额
        #       * :frozen_money [Decimal] 冻结金额
        #       * :state [Integer] 账户状态, 0 正常；1 冻结；2 注销
        #       * :type [Integer] 营销户类型，1：服务费账户；2：红包账户
        #
        def marketing_query(card_no, type, devise="000001", remark='')
          service = "marketing_query"

          params = {
            card_no: card_no,
            type: type,
            client: devise,
            custom: remark,
          }

          res = operate_post(:operate, service, params, Http::ErrorCode.marketing_query, ["RD000000"] )

          res
        end
      end #GatewayQuery
    end
  end
end
