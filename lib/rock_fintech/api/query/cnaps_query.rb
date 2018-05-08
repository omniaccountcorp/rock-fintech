# coding: utf-8
module RockFintech
  module Api
    module Query
      module CnapsQuery

        # 联行号查询
        #
        # @param keywords [Array]
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #       * :banks [Array] 查询结果银行列表
        #         * :union_bank_code [String] 人行分配联行号
        #         * :bank_name [String] 银行分支行全称
        #
        def cnaps_query(keywords, devise='000002', remark='')

          service = 'cnaps_query'

          params = {
            keywords: keywords,
            client: devise,
            custom: remark,
          }

          res = operate_post(:query, service, params, Http::ErrorCode.cnaps_query, ['RD000000'])

          res
        end

      end
    end
  end
end
