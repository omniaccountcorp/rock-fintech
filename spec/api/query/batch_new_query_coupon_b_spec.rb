# coding: utf-8
require 'spec_helper'

RSpec.describe '批次发红包查询(新)' do
  let(:batch_no) { '5b052338cd5dbba79d000002' }

  it '同步成功' do
    res = client.batch_new_query_payment_b(batch_no, '000001', '红包发放')

    expect(res[:code]).to eq('RD000000')
  end
end
