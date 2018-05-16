# coding: utf-8
require 'spec_helper'

RSpec.describe '撤销自动投标申请' do
  it '失败' do
    res = client.revoke_auto_bid("test", RockFintech::Utils.gen_flow_id, "",
                                 '000001', '备注')

    expect(res[:code]).not_to eq('RD000000')
  end
end
