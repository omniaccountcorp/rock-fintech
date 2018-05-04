# coding: utf-8
require 'spec_helper'

RSpec.describe '账户业务流水查询' do
  let(:card_no) { "86666882002000446801" }
  let(:begin_date) { "20180503" }
  let(:end_date) { "20180503" }
  let(:current_result) { 1 }
  let(:total_result) { 20 }

  it '成功查询' do
    result = client.account_transaction_query(card_no, "", "", begin_date, end_date, "", "", current_result, total_result)
    # ap result
    aggregate_failures do
      expect(result[:msg]).to  eq "交易成功"
      expect(result[:data][:code]).to eq "RD000000"
    end
  end

end
