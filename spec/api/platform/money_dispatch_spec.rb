# coding: utf-8
require 'spec_helper'

RSpec.describe 'P2P产品红包发放' do
  let(:card_no) { "6666882121100034167" }
  let(:card_no_in) { "86666882002000446801" }

  it '发放成功' do
    allow(client).to receive(:money_dispatch).and_return({
                                                           result: 'S',
                                                           code: 'RD000000',
                                                           data: {msg: '交易成功', service: 'money_dispatch'},
                                                         })

    result = client.money_dispatch(card_no, card_no_in, 3, 2000, 0, '')
    # ap result
    aggregate_failures do
      expect(result[:code]).to_not eq nil
      expect(result[:data][:msg]).to eq "交易成功"
      expect(result[:data][:service]).to eq "money_dispatch"
    end
  end
end
