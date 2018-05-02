# coding: utf-8

require 'rock_fintech_helper'

Rspec.describe 'money' do
  context 'coupon_recharge' do
    it '给营销账户充值' do
      res = client.coupan_recharge(RockFintech::Utils.gen_flow_id, 10.11)

      ap res

      expect(res[:code]).to 'RD000000'
    end
  end
end
