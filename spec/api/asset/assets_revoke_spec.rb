# coding: utf-8
require 'spec_helper'

RSpec.describe '撤标' do
  it '撤标失败' do
    res = client.assets_revoke("test", 'test', "500.00", "",
                               '000001', '备注')

    expect(res[:code]).not_to eq('RD000000')
  end
end
