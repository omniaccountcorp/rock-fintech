# coding: utf-8
module RockFintech
  module Api
    module Account
      module FindAccountById
        # 按身份证号查询电子账号信息
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #       * :mobile [String] 手机号
        #       * :product [String] 产品号
        #       * :card_no [String] 电子账号
        #       * :customer_no [String] 客户号
        #       * :issue_date [String] 开户日期
        #       * :name [String] 持卡人姓名
        #       * :cert_type [String] 证件类型，15-身份证18位
        #       * :cert_no [String] 证件号码
        #
        def find_account_by_id(cert_type, cert_no, devise='000001', remark='')
          service = 'find_account_by_id'

          params = {
            cert_type: cert_type,
            cert_no: cert_no,
            client: devise,
            custom: remark,
          }

          res = operate_post(:query, service, params, Http::ErrorCode.find_account_by_id, ['RD000000'])

          res
        end

      end # module
    end
  end
end
