# coding: utf-8
require 'spec_helper'

RSpec.describe '批次还款查询(新)' do
  it '同步成功' do
    res = client.batch_new_query_repayment_b("110", '000001', '备注')

    expect(res[:code]).to eq('RD000000')
  end
end
