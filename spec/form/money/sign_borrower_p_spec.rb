# coding: utf-8
require 'spec_helper'

RSpec.describe '借款人放款手续费和还款金额签约' do
  let(:flow_id) { RockFintech::Utils.gen_flow_id }
  let(:card_no) { '86666882002000446801' }
  let(:payment_amount) { '100000' }
  let(:repayment_amount) { '100000' }
  let(:payment_start_time) { Time.now }
  let(:repayment_start_time) { Time.now }
  let(:payment_end_time) { Time.now + 3600 * 24 * 365 }
  let(:repayment_end_time) { Time.now + 3600 * 24 * 365 }
  let(:callbcak_url) { 'http://test.omniaccount.com' }
  let(:success_url) { 'http://test.omniaccount.com' }
  let(:fail_url) { 'http://test.omniaccount.com' }

  it '获取跳转 url' do
    res = client.sign_borrower_p(card_no, payment_amount, repayment_amount,
                                 flow_id, payment_start_time, repayment_start_time,
                                 payment_end_time, repayment_end_time,  callbcak_url,
                                 success_url, fail_url)

    expect(res[:result]).to eq 'S'
    expect(res[:code]).to eq 'RD000000'
  end
end
