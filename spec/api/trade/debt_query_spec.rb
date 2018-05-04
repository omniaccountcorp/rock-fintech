# coding: utf-8
require 'spec_helper'

RSpec.describe '标的投标详情' do
  let(:card_no) { "86666882002000446801" }
  let(:asset_no) { 20 }
  it '成功查询' do
    result = client.debt_query(card_no, asset_no)
    ap result
    aggregate_failures do
      expect(result[:code]).to_not eq nil
      expect(result[:data][:service]).to eq "debt_query"
    end
  end
end
