# coding: utf-8
require 'spec_helper'

RSpec.describe '转让方转让手续费签约' do
  let(:card_no) { '86666882002000446801' }
  let(:flow_id) { RockFintech::Utils.gen_flow_id }
  let(:amount) { '100000' }
  let(:start_time) { Time.now }
  let(:end_time) { Time.now + 3600 * 24 * 365 }
  let(:callbcak_url) { 'http://test.omniaccount.com' }
  let(:success_url) { 'http://test.omniaccount.com' }
  let(:fail_url) { 'http://test.omniaccount.com' }

  it '获取跳转 url' do
    res = client.sign_transfer_p(card_no, flow_id, amount, start_time,
                                 end_time, callbcak_url, success_url, fail_url)

    expect(res[:result]).to eq 'S'
    expect(res[:code]).to eq 'RD000000'
  end
end
