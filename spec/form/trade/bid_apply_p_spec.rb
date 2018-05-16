# coding: utf-8
require 'spec_helper'

RSpec.describe '投资人投标申请' do
  let(:card_no) { '86666882002000446801' }
  let(:flow_id) { RockFintech::Utils.gen_flow_id }
  let(:amount) { 100 }
  let(:asset_no) { 'test' }
  let(:interest_date) { Time.now }
  let(:interest_type) { '1' }
  let(:interest_day) { '' }
  let(:end_date) { Time.now + 3600 * 24 * 30 }
  let(:interest_rate) { '10' }
  let(:frozen_flag) { '1' }
  let(:use_bonus) { '1' }
  let(:bonus_amount) { '2' }
  let(:mobile) { '15922510001' }
  let(:transact_date) { '' }
  let(:third_custom) { '' }
  let(:success_url) { 'http://test.omniaccount.com' }
  let(:fail_url) { 'http://test.omniaccount.com' }
  let(:forget_pwd_url) { 'http://test.omniaccount.com' }
  let(:callback_url) { 'http://test.omniaccount.com' }

  it '获取页面失败' do
    res = client.bid_apply_p(card_no, flow_id, amount, asset_no, interest_date, 
                             interest_type, interest_day, end_date, interest_rate, 
                             frozen_flag, use_bonus, bonus_amount, mobile, transact_date,
                             third_custom, success_url, fail_url, forget_pwd_url, callback_url)

    expect(res[:result]).to eq 'F'
  end
end
