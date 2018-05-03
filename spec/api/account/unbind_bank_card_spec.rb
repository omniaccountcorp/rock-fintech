# coding: utf-8
require 'spec_helper'

RSpec.describe '解绑银行卡' do
  let(:card_no) { '12312312' }
  let(:bank_card_no) { '6212262201023557228' }
  let(:customer_no) { '123123123' }

  it '返回错误信息' do
    res = client.account_balance(card_no, customer_no)

    expect(res[:code]).to eq('RD000006')
  end
end
