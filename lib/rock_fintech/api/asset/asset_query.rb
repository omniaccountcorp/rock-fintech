# coding: utf-8
module RockFintech
  module Api
    module Asset
      module AssetsEnroll

        # 标的单笔查询
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #       * :asset_no [String] 标的编号
        #       * :asset_brief [String] 产品描述
        #       * :card_no [String] 借款人电子账号
        #       * :name [String] 借款金额
        #       * :loan_term [String] 项目期限
        #       * :issue_date [String] 发标日期
        #       * :state [String] 记录状态: (0: 空标, 1: 投标, 2: 流标, 3: 满标, 4: 已撤销)
        #       * :warrant_card_no [String] 担保人人电子账号
        #       * :warrant_name [String] 担保人姓名
        #       * :borrow_card_no [String] 名义借款人电子账户
        #       * :third_custom [String] 第三方平台保留域
        #
        def asset_query(asset_no, third_custom='',
                        devise='000001', remark='')

          service = 'asset_query'

          params = {
            asset_no: asset_no,
            third_custom: third_custom,
            client: devise,
            custom: remark,
          }

          res = operate_post(:query, service, params, Http::ErrorCode.asset_query, ['RD000000'])

          res
        end

      end
    end
  end
end
