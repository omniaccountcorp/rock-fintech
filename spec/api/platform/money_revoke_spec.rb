# coding: utf-8
require 'spec_helper'

RSpec.describe 'P2P产品红包发放撤销' do
  let(:card_no) { "86666882002000446801" }
  let(:card_no_in) { "86666882002000446801" }

  it '撤销失败' do
    result = client.money_revoke('20180504', "6691fd7db6d0091b4cf8d6d1f05c644b", card_no, card_no_in, 3, 2000, 0, '')
    # ap result
    aggregate_failures do
      expect(result[:code]).to_not eq nil
      expect(result[:data][:msg]).to eq "红包发放记录不存在"
      expect(result[:data][:service]).to eq "money_revoke"
    end
  end
end
