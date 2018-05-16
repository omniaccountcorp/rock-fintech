# coding: utf-8
require 'spec_helper'

RSpec.describe '设置交易密码form' do
  it '设置交易密码页面获取成功' do
    res = client.set_password_p(RockFintech::Utils.gen_flow_id,
                                '13000404246',
                                '86666882002000446801',
                                'http://test.omniaccount.com', 'http://test.omniaccount.com',
                                'http://test.omniaccount.com')

    puts res[:data]
    expect(res[:code]).to eq('RD000000')
  end
end
