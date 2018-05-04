# coding: utf-8
require 'spec_helper'

RSpec.describe '营销户信息' do
  let(:card_no_hong_bao) { "6666882121100034167" }
  let(:card_no_service_fee) { "6666882121100034165" }
  it '红包账户成功查询' do
    result = client.marketing_query(card_no_hong_bao, 2)
    aggregate_failures do
      expect(result[:code]).to eq "RD000000"
      expect(result[:data][:card_no]).to eq "6666882121100034167"
      expect(result[:data][:type]).to eq 2
    end
  end

  it "服务费账户成功查询" do
    result = client.marketing_query(card_no_service_fee, 1)
    ap result
    aggregate_failures do
      expect(result[:code]).to eq "RD000000"
      expect(result[:data][:name]).to_not eq nil
      expect(result[:data][:date]).to_not eq nil
    end
  end

end
