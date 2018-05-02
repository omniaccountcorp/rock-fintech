# coding: utf-8

module RockFintech
  module Api
    module User
      module AccountMobile

        # 电子账户查询
        #
        # @param card_no [ String ] 电子账号
        # @param phone [ String ] 手机号，默认为空
        # @param client [ String ] 交易终端，默认手机 000001手机APP 000002网页 000003微信 000004柜面
        # @param remark [ String ] 备注，默认为空
        #
        # @return [ Hash ] 结果集
        #   * :result [String] 业务结果：'S/F/P'
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #     * :contracts [String] 用户协议号
        #     * :mobile [String] 用户手机号
        #
        def AccountMobile(card_no, phone='', client='000001', remark='')
          service = 'account_mobile'
          post_path = '/deposit'

          params = {
            card_no: card_no,
            mobile: phone,
            client: client,
            custom: remark,
            timestamp: Time.now.to_i,
          }

          res = operate_post(:query, service, params, post_path, Http::ErrorCode.account_mobile, ['RD000000'])

          RockFintech.logger.info res

          res
        end

      end
    end
  end
end
