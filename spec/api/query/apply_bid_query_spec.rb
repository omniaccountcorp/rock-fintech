# coding: utf-8
require 'spec_helper'

RSpec.describe '投资人投标申请查询' do
  it '失败' do
    res = client.apply_bid_query("110", RockFintech::Utils.gen_flow_id,
                                 '000001', '备注')

    expect(res[:code]).not_to eq('RD000000')
  end
end
