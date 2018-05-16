# coding: utf-8
require 'spec_helper'

RSpec.describe '受托支付申请' do
  let(:card_no) { "86666882002000446801" }
  let(:out_serial_no) { "5aec67313c32864ce6000001" }
  let(:origin_serial_no) { "5aec67313c32864ce6000001" }
  let(:interface_type) { 'bid' }
  let(:cert_no) { '500224199511150001' }


  it "成功申请" do
    result = client.trustee_pay_p( RockFintech::Utils.gen_flow_id, card_no, 40, 12, cert_no, card_no, "", 'http://test.omniaccount.com', 'http://test.omniaccount.com', 'http://test.omniaccount.com')

    # ap result
    aggregate_failures do
      expect(result[:code]).to eq "RD001147"
      expect(result[:data][:service]).to eq "trustee_pay_p"
    end
  end

end
