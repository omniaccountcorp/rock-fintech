# coding: utf-8
require 'spec_helper'

RSpec.describe '签约累加' do
  let(:card_no) { "86666882002000446801" }
  let(:out_serial_no) { "5aec67313c32864ce6000001" }
  let(:origin_serial_no) { "5aec67313c32864ce6000001" }
  let(:interface_type) { 'bid' }

  it "成功签约" do
    result = client.sign_again_p(card_no, out_serial_no, origin_serial_no, interface_type, 1000, 2000, "20180503", "20180504", 'http://test.omniaccount.com',  'http://test.omniaccount.com', 'http://test.omniaccount.com')

    # ap result
    aggregate_failures do
      expect(result[:code]).to eq('RD001021')
      expect(result[:data][:msg]).to include "不存在"
      expect(result[:data][:service]).to eq 'sign_again_p'
    end

  end

end
