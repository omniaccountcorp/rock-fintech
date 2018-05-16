# coding: utf-8
require 'spec_helper'

RSpec.describe '标的查询' do
  it '标的查询失败' do
    res = client.asset_query("test", 'test',
                             '000001', '备注')

    expect(res[:code]).not_to eq('RD000000')
  end
end
