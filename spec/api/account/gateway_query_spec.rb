# coding: utf-8
require 'spec_helper'

RSpec.describe '网关自定义下单查询（查询内容：投标，签约，债转，受托支付申请)' do
  it '成功查询' do
    result = client.gateway_query(30)
    # ap result
    aggregate_failures do
      expect(result[:code]).to_not eq nil
      expect(result[:data][:service]).to eq "gateway_query"
    end
  end

end
