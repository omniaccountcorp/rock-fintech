# coding: utf-8
require 'spec_helper'

RSpec.describe '营销账户充值' do
  let(:money) { 100 }
  let(:flow_id) { RockFintech::Utils.gen_flow_id }

  it '充值 100，返回成功' do
    res = client.coupon_recharge(money, flow_id)

    expect(res[:result]).to eq 'S'
    expect(res[:code]).to eq 'RD000000'
    expect(res[:data][:amount]).to eq 100
  end
end
