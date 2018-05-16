# coding: utf-8
require 'spec_helper'

RSpec.describe '营销账户提现' do
  let(:money) { 1 }
  let(:flow_id) { RockFintech::Utils.gen_flow_id }

  it '充值 100，返回成功' do
    res = client.coupon_withdraw(money, flow_id)

    expect(res[:result]).to eq 'S'
    expect(res[:code]).to eq 'RD000000'
    expect(res[:data][:amount]).to eq 1
  end
end
