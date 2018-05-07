# coding: utf-8
require 'spec_helper'

RSpec.describe '批量还款' do
  it '失败' do
    items = [
      {
        out_card_no: "test",
        amount: "500.00",
        interest_amount: "20.00",
        in_card_no: "test",
        currency: "156",
        out_fee_mode: "0",
        out_fee_amount: "",
        in_fee_mode: "0",
        in_fee_amount: "",
        assets_no: "000034",
        auth_code: "20170515173236846273",
        third_reserved: "20170515173236948285",
        serial_no: "20170515173236726149",
        notify_url: "https://test.omniaccount.com",
        reserved: ""
      }
    ].to_json

    notify_url = "test.omniaccount.com"
    res = client.batch_repayment_b("1", 'test', "test", "2018-4-22", notify_url, items, '备注')

    expect(res[:code]).to eq('RD000000')
  end
end
