# coding: utf-8
require 'spec_helper'

RSpec.describe '开户结果查询接口' do
  it '成功查询' do
    result = client.create_account_sr_query(1)
    ap result
    aggregate_failures do
      expect(result[:code]).to_not eq nil
      expect(result[:data][:service]).to eq "create_account_sr_query"
    end
  end

end
