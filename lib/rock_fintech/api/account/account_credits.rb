# coding: utf-8
module RockFintech
  module Api
    module Account
      module AccountCredits
        # 查询投资人电子账户名下的投资明细（包括投标中的标的）
        #
        # @param card_no	[String] 电子账号，必填，19
        # @param asset_no	[String] 标的编号，有条件必填，为空时查询所有的产品；不为空时按输入的产品发行方查询，6
        # @param state	[Integer] 查询的记录状态, 有条件必填，0：查询所有状态；1：投标中 2：放款中 3：计息中 4：本息已返回还，1
        # @param page_flag	[Integer] 翻页标志，有条件必填，首次查询上送空 ；翻页查询上送1，1
        # @param buy_date	[Date] 投标日期，有条件必填，翻页控制使用；首次查询上送空；翻页查询时上送上页返回的最后一条记录的投标日期，8
        # @param out_serial_no	[String] 交易流水号，有条件必填 ，翻页控制使用；首次查询上送空；翻页查询时上送上页返回的最后一条记录的申请流水号，32
        # @param asset_page	[String] 标的编号，有条件必填 ，翻页控制使用；首次查询上送空；翻页查询时上送上页返回的最后一条记录的标的编号，6
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
        #       * :card_no	[String] 电子账号，19
        #       * :name	[String] 持卡人姓名,60
        #       * :count	[Integer] 本次返回交易条数,2
        #       * :page_flag	[Integer] 翻页标志，0：查询完毕；1：需继续翻页查询，1
        #       * :asset_no	[Integer] 标的编号，6
        #       * :buy_date	[Date] 投标日期，8
        #       * :out_serial_no [Integer] 交易流水号，32
        #       * :amount	[Decimal] 投标金额，13
        #       * :interest_rate [Integer] 预期年化收益率，
        #       * :forcast_income	[Decimal] 预期收益，8
        #       * :income_total	[Decimal] 预期本息收益，13
        #       * :state	[Integer] 状态，1：投标中；2：计息中；3：到期待返还；4：本息已返还，1
        #       * :bonus_amount	[Decimal] 抵扣红包，9
        #
        def account_credits(card_no, asset_no="", state=0, page_flag, buy_date, out_serial_no, asset_page, devise="000001", remark='')
          service = "account_credits"

          params = {
            card_no: card_no,
            asset_no: asset_no,
            state: state,
            page_flag: page_flag,
            buy_date: buy_date,
            out_serial_no: out_serial_no,
            asset_page: asset_page,
            client: devise,
            custom: remark,
          }

          res = operate_post(:operate, service, params, Http::ErrorCode.account_credits, ["RD000000"] )

          res
        end
      end #AccountCredits
    end
  end
end
