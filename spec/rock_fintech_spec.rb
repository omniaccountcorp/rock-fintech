# coding: utf-8
require 'spec_helper'

RSpec.describe RockFintech do
  it "has a version number" do
    expect(RockFintech::VERSION).not_to be nil
  end

  it "验证 client 的 verify" do
    params = {"card_no"=>"86666882002000509343", "out_serial_no"=>"NM5aed5a27d9dca15081000003", "sign_flag"=>"having", "start_time"=>1525504551, "end_time"=>1588662951, "amount"=>99999999.99, "sign_date"=>"2018-05-05", "sign_time"=>"15:16:04", "code"=>"RD000000", "msg"=>"交易成功", "service"=>"sign_transfer_p", "version"=>"2.0.0", "uuid"=>"uuid5aed5a27d9dca15081000003", "sequence_id"=>"17ddcb30003f76c373b7f9eb66341eb4", "custom"=>"", "encode"=>"UTF-8", "sign_type"=>"MD5", "timestamp"=>1525504551, "client"=>"000001", "sign"=>"836f256a41a8fce9cfc4f9441f185d55"}

    res = client.verify_data?(RockFintech::Utils.symbolize_keys(params))

    expect(res).to eq(true)
  end
end
