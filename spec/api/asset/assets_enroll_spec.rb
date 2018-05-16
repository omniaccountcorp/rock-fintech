# coding: utf-8
require 'spec_helper'

RSpec.describe '发标' do
  it '发标失败' do
    res = client.assets_enroll("test", 'test', "test",
                               "500.00", "1", "22",
                               "10.00", "1", "", "", "", "",
                               '000001', '备注')

    expect(res[:code]).not_to eq('RD000000')
  end
end
