# coding: utf-8
require 'spec_helper'

RSpec.describe '批次放款查询(新)' do
  it '同步成功' do
    res = client.batch_new_query_payment_b("dazhanghu", '000001', '备注')

    expect(res[:code]).to eq('RD000000')
  end
end
