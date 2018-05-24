# coding: utf-8
require 'spec_helper'

RSpec.describe '电子账户绑卡关系查询' do
  let(:card_no) { '86666882002000446801' }

  it '查询成功' do
    res = client.binding_list(card_no)

    expect(res[:code]).to eq('RD000000')
  end
end
