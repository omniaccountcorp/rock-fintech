# coding: utf-8
require 'spec_helper'

RSpec.describe '按手机号查询电子账号信息' do
  let(:mobile) { '15922510001' }

  it '查询成功' do
    res = client.find_account_by_mobile(mobile)

    puts res[:data]
    expect(res[:code]).to eq('RD000000')
  end
end
