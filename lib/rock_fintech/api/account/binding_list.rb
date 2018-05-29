# coding: utf-8
module RockFintech
  module Api
    module Account
      module BindingList
        # 电子账户绑卡关系查询
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #       * :card_no [String] 电子账号
        #       * :name [String] 持卡人姓名
        #       * :sign_flag [String] 签约状态 0：未签约 1：已签约
        #       * :sign_date [String] 签约日期
        #       * :sign_time [String] 签约时间
        #       * :states [String] 解绑状态
        #       * :revoke_sign_date [String] 签约取消日期
        #       * :revoke_sign_time [String] 签约取消时间
        #
        def binding_list(card_no, devise='000001', remark='')
          service = 'binding_list'

          params = {
            card_no: card_no,
            client: devise,
            custom: remark,
          }

          res = operate_post(:query, service, params, Http::ErrorCode.binding_list, ['RD000000'])

          res
        end

      end # module
    end
  end
end
