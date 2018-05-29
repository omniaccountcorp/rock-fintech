# coding: utf-8
require 'spec_helper'

RSpec.describe 'P2P产品红包发放撤销' do
  let(:card_no) { "6666882121100034167" }
  let(:card_no_in) { "86666882002000446801" }

  it '撤销失败' do
    result = client.money_revoke('20180909', "9830eab0ea908d2d3d80a2f9ec4d9", card_no, card_no_in, 3, 1000, 0, '')
    # ap result
    aggregate_failures do
      expect(result[:code]).to_not eq nil
      expect(result[:data][:msg]).to eq "该笔红包撤销流水已处理"
      expect(result[:data][:service]).to eq "money_revoke"
    end
  end
end
