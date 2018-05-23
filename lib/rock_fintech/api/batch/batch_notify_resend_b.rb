# coding: utf-8
module RockFintech
  module Api
    module Batch
      module BatchNotifyResendB

        # 批处理回调重发接口
        #
        # @return [ Hash ] 结果集
        #   * :result [String] "S"/"F"/"P"
        #   * :request_params [Hash] 请求参数
        #   * :response [Object] 请求返回对象
        #   * :code [String] 结果代码
        #   * :msg [String] 结果信息
        #   * :data: 具体业务返回信息
        #
        def batch_notify_resend_b(req_sequence_id, remark='')
          service = 'batch_notify_resend_b'

          params = {
            req_sequence_id: req_sequence_id,
            custom: remark,
          }

          res = operate_post(:operate, service, params, Http::ErrorCode.batch_notify_resend_b, ['RD000000'])

          res
        end

      end
    end
  end
end
