# coding: utf-8
require 'spec_helper'

RSpec.describe '自动投标申请' do
  it '失败' do
    res = client.auto_bid_apply("test", RockFintech::Utils.gen_flow_id, "5000.00",
                                "0", "0.00", "999999999", "20170807", "1", "", "10000",
                                "20180211", "0", "",
                                '000001', '备注')

    expect(res[:code]).not_to eq('RD000000')
  end
end
