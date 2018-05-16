# coding: utf-8
require 'spec_helper'

RSpec.describe '批次还款查询' do
  it '同步成功' do
    items = [
      {
        out_card_no: "110",
        in_card_no: "120",
        assets_no: "dazhanghu",
        auth_code: "nidaye",
        third_reserved: "",
        serial_no: "123"
      }
    ]

    res = client.batch_query_payment_b("dazhanghu", 1, "1",
                                       "2018-4-22", items,
                                       '000001', '备注')

    expect(res[:code]).to eq('RD000000')
  end
end
