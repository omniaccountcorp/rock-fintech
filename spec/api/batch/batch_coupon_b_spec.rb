# coding: utf-8
require 'spec_helper'

RSpec.describe '批量发放红包' do
  it '请求成功' do
    items = [{
      in_card_no: '86666882002000446801',
      currency: '156',
      amount: '1.00',
      coupon_date: '20180519',
      coupon_type: '001',
      name: '陈晨',
      third_reserved: RockFintech::Utils.gen_flow_id,
    }]

    notify_url = 'http://test.omniaccount.com'
    res = client.batch_coupon_b(RockFintech::Utils.gen_flow_id, '1', notify_url, items)

    expect(res[:code]).to eq('RD000000')
  end
end
