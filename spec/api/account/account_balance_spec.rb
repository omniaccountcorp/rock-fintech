# coding: utf-8
require 'spec_helper'

RSpec.describe '电子账户余额查询' do
  let(:card_no) { '12312312' }
  let(:customer_no) { '123123123' }

  it '返回错误信息' do
    res = client.account_balance(card_no, customer_no)

    expect(res[:code]).to eq('RD000006')
  end

  it '查询成功' do
    res = client.account_balance('86666882002000446801', '13000404246')

    puts res[:data]
    expect(res[:code]).to eq('RD000000')
  end
end
