# coding: utf-8
require 'spec_helper'

RSpec.describe '转让手续费签约查询' do
  let(:card_no) { '86666882002000446801' }

  it '查询成功' do
    res = client.sign_transfer_check(card_no)
    # ap res
    aggregate_failures do
      expect(res[:code]).to eq('RD001012')
      expect(res[:data][:service]).to eq "sign_transfer_check"
    end
  end
end
