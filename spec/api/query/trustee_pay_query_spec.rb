# coding: utf-8
require 'spec_helper'

RSpec.describe '查询受托支付签约详情' do
  let(:card_no) { '1231231232' }
  it '成功查询' do
    res = client.trustee_pay_query(card_no, '000001', '备注')
    # ap res
    aggregate_failures do
      expect(res[:code]).to eq('RD001055')
      expect(res[:data][:service]).to eq "trustee_pay_query"
    end

  end
end
