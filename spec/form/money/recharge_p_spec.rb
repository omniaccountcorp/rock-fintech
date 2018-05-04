# coding: utf-8
require 'spec_helper'

RSpec.describe '提现' do
  let(:card_no) { '86666882002000446801' }
  let(:bank_type) { 'private' }
  let(:flow_id) { RockFintech::Utils.gen_flow_id }
  let(:callback_url) { 'http://test.omniaccount.com' }
  let(:success_url) { 'http://test.omniaccount.com' }
  let(:fail_url) { 'http://test.omniaccount.com' }
  let(:bank_name) { '工商银行' }
  let(:bank_id_no) { 'BOC' }
  let(:amount) { 100 }
  let(:bind_card) { '6212262201023557228' }
  let(:fee) { 1 }
  let(:cert_type) { '15' }
  let(:cert_no) { '500224199511150001' }
  let(:name) { '陈晨' }
  let(:mobile) { '15922510001' }
  let(:channel_flag) { 'N' }

  it '获取页面 url' do
    res = client.withdraw_p(flow_id, card_no, '', bind_card, name, cert_no,
                            cert_type, mobile, amount, fee, callback_url,
                            channel_flag, '', '', '', '', '', '', '', success_url, fail_url)

    expect(res[:code]).to eq('RD000000')
  end
end
