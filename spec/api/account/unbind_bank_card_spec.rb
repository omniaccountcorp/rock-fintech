# coding: utf-8
require 'spec_helper'

RSpec.describe '解绑银行卡' do
  let(:card_no) { '12312312' }
  let(:bank_card_no) { '6212262201023557228' }
  let(:customer_no) { '123123123' }
  let(:flow_id) { RockFintech::Utils.gen_flow_id }
  let(:card_type) { '0' }

  it '返回错误信息' do
    res = client.unbind_bank_card(card_no, bank_card_no, customer_no, flow_id, card_type)

    puts res
    expect(res[:code]).to eq('RD000094')
  end
end
