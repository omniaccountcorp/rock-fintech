# coding: utf-8
require 'spec_helper'

RSpec.describe '投资人自动投标签约form' do
  it '失败' do
    res = client.sign_auto_bid_p("test", '10000000.00', '10000000.00',
                            RockFintech::Utils.gen_flow_id, "2018-4-22",
                            'http://test.omniaccount.com', "http://test.omniaccount.com",
                            "http://test.omniaccount.com", '000003', '备注')


    expect(res[:code]).not_to eq('RD000000')
  end
end
