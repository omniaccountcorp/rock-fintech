# coding: utf-8
require 'spec_helper'

RSpec.describe '绑卡form' do
  it '返回错误信息' do
    res = client.bind_bank_card_p('0',
                                  RockFintech::Utils.gen_flow_id,
                                  'http://test.omniaccount.com', 'http://test.omniaccount.com',
                                  'http://test.omniaccount.com',
                                  '86666882002000446801')

    puts res
    expect(res[:code]).to eq('RD000640')
  end
end
