# coding: utf-8
require 'spec_helper'

RSpec.describe '电子账户余额查询' do
  let(:card_no) { '12312312' }
  let(:customer_no) { '123123123' }

  it '返回错误信息' do
    res = client.account_balance(card_no, customer_no)

    expect(res[:code]).to eq('RD000006')
  end
end
