# coding: utf-8
require 'spec_helper'

RSpec.describe '线下企业账户信息入库' do
  it '失败' do
    res = client.enterprise_add("dazhanghu", "大账户", "18888888888",
                                "123456789", "123456", "test",
                                RockFintech::Utils.gen_flow_id, "2",
                                '000001', '备注')

    expect(res[:code]).not_to eq('RD000000')
  end
end
