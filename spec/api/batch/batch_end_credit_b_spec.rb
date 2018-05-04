# coding: utf-8
require 'spec_helper'

RSpec.describe '批量结束债权' do
  it '失败' do
    items = [
      {
        out_card_no: "test",
        in_card_no: "test",
        assets_no: "test",
        auth_code: "test",
        serial_no: "test",
        third_custom: "",
      }
    ]

    res = client.batch_end_credit_b("1", 'test', "test", "2018-4-22", items,
                                    '000001', '备注')

    expect(res[:code]).not_to eq('RD000000')
  end
end
