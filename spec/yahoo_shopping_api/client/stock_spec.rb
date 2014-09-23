require 'yahoo_shopping_api'
require 'spec_helper'

describe YahooShoppingApi::Client::Stock do
  let(:client) {described_class.new(:seller_id => 'store', :access_token => 'dummy_access_token')}
  describe "initialize" do
    it "have a seller_id" do
      expect(client.seller_id).to eq "store"
    end

    it "have an access token" do
      expect(client.access_token).to eq "dummy_access_token"
    end
  end

  describe '#set' do
    let(:endpoint) {"https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/setStock"}
    context 'access success' do
      before {stub_request(:post, endpoint).to_return(:status => 200, body: fixture('stock/set.xml'))}
      subject {client.set('item_url', 10)}
      it {is_expected.to be_a ::YSA::Response::Stock::Set}
    end

    context 'session timeout' do
      before {stub_request(:post, endpoint).to_return(:status => 401, body: fixture('timeout.xml'))}
      it "" do
        expect {client.set("item_url", 10)}.to raise_error ::YSA::AuthError
      end
    end
  end

  describe '#get' do
    let(:endpoint) {"https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/getStock"}

    context 'access success' do
      before {stub_request(:post, endpoint).to_return(:status => 200, body: fixture('stock/get.xml'))}
      subject {client.get('item_url')}
      it {is_expected.to be_a ::YSA::Response::Stock::Get}
    end

    context 'session timeout' do
      before {stub_request(:post, endpoint).to_return(:status => 401, body: fixture('timeout.xml'))}
      it "" do
        expect {client.get("item_url")}.to raise_error ::YSA::AuthError
      end
    end
  end
end
