# coding: utf-8
require 'spec_helper'

RSpec.describe '资金交易状态查询' do
  it '失败' do
    res = client.money_query("100", '000001', '备注')

    expect(res[:code]).not_to eq('RD000000')
  end
end
