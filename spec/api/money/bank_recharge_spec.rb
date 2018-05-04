# coding: utf-8
require 'spec_helper'

RSpec.describe '' do
  let(:card_no) { '86666882002000446801' }
  let(:bank_type) { 'private' }
  let(:customer_no) { '123123123' }
  let(:flow_id) { RockFintech::Utils.gen_flow_id }
  let(:customer_no) { '13000404246' }
  let(:callback_url) { 'http://test.omniaccount.com' }
  let(:redirect_url) { 'http://test.omniaccount.com' }
  let(:bank_name) { '工商银行' }
  let(:bank_id_no) { 'BOC' }
  let(:amount) { 100 }

  it '获取页面 url' do
    res = client.bank_recharge(card_no, bank_type, callback_url, customer_no, redirect_url,
                               '', '', flow_id, bank_name, bank_id_no, amount)

    expect(res[:code]).to eq('RD000000')
  end
end
