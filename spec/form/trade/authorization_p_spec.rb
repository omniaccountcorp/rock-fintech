# coding: utf-8
require 'spec_helper'

RSpec.describe '业务授权申请' do
  let(:card_no) { '86666882002000446801' }
  let(:start_time) { Time.now }
  let(:end_time) { Time.now + 3600 * 24 * 365 }

  it '成功' do
    res = client.authorization_p(card_no, '10000000.00', '10000000.00',
                                 RockFintech::Utils.gen_flow_id, start_time, end_time,
                                'http://test.omniaccount.com', 'http://test.omniaccount.com',
                                'http://test.omniaccount.com')

    expect(res[:result]).to eq 'S'
    expect(res[:code]).to eq 'RD000000'
  end
end
