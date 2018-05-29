# coding: utf-8
require 'spec_helper'

RSpec.describe '批处理回调重发接口' do
  it '失败' do
    res = client.batch_notify_resend_b('8227ef110387c6bf3ce040c1c08b34d6')

    expect(res[:code]).not_to eq('RD000000')
  end
end
