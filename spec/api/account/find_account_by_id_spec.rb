# coding: utf-8
require 'spec_helper'

RSpec.describe '个人户按证件号查询电子账号' do
  let(:cert_type) { '15' }
  let(:cert_no) { '500224199511150001' }

  it '查询成功' do
    res = client.find_account_by_id(cert_type, cert_no)

    puts res[:data]
    expect(res[:code]).to eq('RD000000')
  end
end
