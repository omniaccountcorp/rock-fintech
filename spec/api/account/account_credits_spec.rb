# coding: utf-8
require 'spec_helper'

RSpec.describe '查询投资人电子账户名下的投资明细' do
  let(:card_no) { "86666882002000446801" }
  let(:asset_no) { "" }
  let(:state) { 0 }
  let(:page_flag) { "" }
  let(:buy_date) { "" }
  it '成功查询' do
    result = client.account_credits( card_no, asset_no, state, page_flag, buy_date, "", "" )
    # ap result
    aggregate_failures do
      expect(result[:code]).to_not eq nil
      expect(result[:data][:timestamp]).to_not eq nil
    end
  end

end
