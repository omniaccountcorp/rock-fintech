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
        #       * :out_serial_no [String] 申请流水号
        #       * :order_id [String] 订单号
        #       * :url [String] 页面跳转 url
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

          res = operate_post(:query, service, params, Http::ErrorCode::Asset.asset_query, ['RD000000'])

          res
        end

      end
    end
  end
end
