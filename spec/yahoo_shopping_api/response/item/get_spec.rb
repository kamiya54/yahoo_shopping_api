require 'spec_helper'

describe YSA::Response::Item::Get do
  describe 'initialize' do
    context 'with invalid arguments' do
      it "" do
        expect{YSA::Response::Item::Get.new({})}.to raise_error ArgumentError
      end
    end
  end

  let(:endpoint) {"https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/getItem"}
  let(:connection) {Faraday.new(:url => endpoint)}

  context 'access success' do
    before {stub_request(:post, endpoint).to_return(:status => 200, body: fixture('item/get.xml'))}
    subject {described_class.new(connection.post)}
    it {is_expected.to respond_to(:item_code)}
    it {is_expected.to respond_to(:price)}
  end

  context 'session timeout' do
    before {stub_request(:post, endpoint).to_return(:status => 401, body: fixture('timeout.xml'))}
    it "" do
      expect{described_class.new(connection.post)}.to raise_error ::YSA::AuthError
    end
  end
end
