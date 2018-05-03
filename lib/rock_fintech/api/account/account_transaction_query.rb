# coding: utf-8
module RockFintech
  module Api
    module Account
      module AccountTransactionQuery
        # 营账户业务流水查询
        #
        # @param card_no	[String] 卡号，必填，电子账户，19
        # @param record_flag	[String] 冲正标志位，条件选填，默认所有，Y是 N否
        # @param transact_type	[String] 交易类型，条件选填，默认所有流水，B：金融流水，N：非金融流水
        # @param begin_date	[Time] 起始记账日期，必填，格式：yyyyMMdd
        # @param end_date	[Time] 结束记账日期，必填，格式：yyyyMMdd
        # @param type	[Integer] 流水类型，条件选填，默认所有交易，0：所有交易；1：转入；2：转出
        # @param order_by	[Integer] 排序，条件选填，默认正序 1：正序 2：倒序
        # @param current_result	[Integer] 起始记录数，必填，大于等于1
        # @param total_result	[Integer] 查询记录条数，必填，不得超过99
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
        #       * :transact_date	[Date] 交易日期,yyyyMMdd
        #       * :transact_time	[Date] 交易时间,HHmmss
        #       * :transact_type	[String] 交易类型，同请求
        #       * :accounting_date	[Date] 记账日期，格式:yyyyMMddHHmmss
        #       * :description	[String] 交易描述
        #       * :record_flag	[String] 冲正标识位，N未冲正，Y冲正
        #       * :card_no	[String] 账号，19
        #       * :remark	[String] 交易具体描述
        #       * :sign	[String] 借贷方标识，C借 D贷
        #       * :transact_amount	[Decimal] 金额
        #       * :account_balance	[Decimal] 记账后余额
        #       * :interest_date	[Date] 起息日，格式:yyyyMMddHHmmss
        #       * :opposit_card_no	[String] 对手交易账号
        #       * :total_result	[Integer] 查询记录条数，同请求
        #       * :current_result	[Integer] 起始记录数，同请求
        #       * :out_num	[Integer] 当前输出笔数
        #       * :end_flag	[Integer] 结束标识位，1：结束；0：未结束
        #       * :total_result	[Integer] 查询记录条数，同请求
        #
        def account_transaction_query(card_no, record_flag, transact_type, begin_date, end_date, type, order_by=1, current_result, total_result, devise="000001", remark='')
          service = "account_transaction_query"

          params = {
            card_no: card_no,
            record_flag: record_flag,
            transact_type: transact_type,
            begin_date: begin_date.strftime("%Y%m%d"),
            end_date: end_date.strftime("%Y%m%d"),
            type: type,
            order_by: order_by,
            current_result: current_result,
            total_result: total_result,
            client: devise,
            custom: remark,Time
          }

          res = operate_post(:operate, service, params, Http::ErrorCode.account_transaction_query, ["RD000000"] )

          res
        end
      end AccountTransactionQuery
    end
  end
end
