# coding: utf-8
require 'spec_helper'

RSpec.describe '查询投资人自动投标签约状态' do
  let(:card_no) { "86666882002000446801" }
  it '成功查询' do
    result = client.sign_bid_query(card_no)
    # ap result
    aggregate_failures do
      expect(result[:code]).to_not eq nil
      expect(result[:data][:service]).to eq "sign_bid_query"
    end
  end

end
