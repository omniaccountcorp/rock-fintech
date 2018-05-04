# coding: utf-8
module RockFintech
  module Api
    module Asset
      module AssetsRevoke

        # 撤标
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #       * :asset_no [String] 标的编号
        #       * :card_no [String] 借款人电子账号
        #       * :name [String] 借款人姓名
        #       * :amount [String] 借款金额
        #       * :issue_date [String] 发表日期
        #       * :state [String] 记录状态: (0: 空标, 1: 投标, 2: 流标, 3: 满标, 4: 已撤销)
        #       * :warrant_card_no [String] 担保人人电子账号
        #       * :warrant_name [String] 担保人姓名
        #       * :third_custom [String] 第三方平台保留域
        #
        def assets_revoke(asset_no, card_no, amount, third_custom="",
                          devise='000001', remark='')

          service = 'assets_revoke'

          params = {
            asset_no: asset_no,
            card_no: card_no,
            amount: amount,
            third_custom: third_custom,
            client: devise,
            custom: remark,
          }

          res = operate_post(:operate, service, params, Http::ErrorCode::Asset.assets_revoke, ['RD000000'])

          res
        end

      end
    end
  end
end
