# coding: utf-8
require 'spec_helper'

RSpec.describe '投资人购买债权' do
  let(:card_no_in) { "86666882002000446801" }
  let(:out_serial_no) { RockFintech::Utils.gen_flow_id }
  let(:origin_serial_no) { "5aec67313c32864ce6000001" }
  let(:card_no_out) { "86666882002000446801" }
  let(:total_balance) { 100.00 }
  let(:amount) { 30.00 }
  let(:transfer_price) { 4 }
  let(:mobile) { "15922510001" }

  it "成功购买" do
    result = client.buy_credit_p(card_no_in, out_serial_no, origin_serial_no, card_no_out, total_balance, amount, transfer_price, "20180503", "4%", 0, 0, "", mobile, 'http://test.omniaccount.com', 'http://test.omniaccount.com', 'http://test.omniaccount.com', 'http://test.omniaccount.com')

    # ap result
    aggregate_failures do
      expect(result[:flow_id]).to_not eq nil
      expect(result[:data][:uuid]).to_not eq nil
    end
  end

end
