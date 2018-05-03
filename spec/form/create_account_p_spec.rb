# coding: utf-8
require 'spec_helper'

RSpec.describe '开户form' do
  it '个人开户页面获取成功' do
    res = client.create_account_p(RockFintech::Utils.gen_flow_id, '200201', '1',
                            'http://test.omniaccount.com', 'http://test.omniaccount.com',
                            'http://test.omniaccount.com', '000003', '备注')

    expect(res[:code]).to eq('RD000000')
  end

  it '企业开户页面获取成功'
end
