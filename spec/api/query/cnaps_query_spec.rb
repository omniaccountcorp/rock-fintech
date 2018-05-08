# coding: utf-8
require 'spec_helper'

RSpec.describe '联行号查询' do
  it '成功' do
    keywords = [
      "招商",
      "杭州滨江"
    ]
    res = client.cnaps_query(keywords, '000001', '备注')

    expect(res[:code]).to eq('RD000000')
  end
end
