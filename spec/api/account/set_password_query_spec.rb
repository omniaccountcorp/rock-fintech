# coding: utf-8
require 'spec_helper'

RSpec.describe '网关重置密码查询接口' do
  let(:order_id) { '12312312' }

  it '查询成功' do
    res = client.set_password_query(order_id)
    aggregate_failures do
      expect(res[:data][:service]).to eq('set_password_query')
      expect(res[:msg]).to include("未查询到数据")
    end
  end

end
