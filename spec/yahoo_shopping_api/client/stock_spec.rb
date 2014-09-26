require 'yahoo_shopping_api'
require 'spec_helper'

describe YahooShoppingApi::Client::Stock do
  let(:client) {described_class.new(:seller_id => 'store', :access_token => 'dummy_access_token')}
  describe "initialize" do
    it "should have a seller_id" do
      expect(client.seller_id).to eq "store"
    end

    it "should have an access token" do
      expect(client.access_token).to eq "dummy_access_token"
    end
  end

  describe '#set' do
    let(:endpoint) {"https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/setStock"}
    context 'access success' do
      before {stub_request(:post, endpoint).to_return(:status => 200, body: fixture('stock/set.xml'))}
      subject {client.set({:item_code => 'item_url', :quantity =>10})}
      it {is_expected.to be_a ::YSA::Response::Stock::Set}
    end

    context 'session timeout' do
      before {stub_request(:post, endpoint).to_return(:status => 401, body: fixture('timeout.xml'))}
      it "" do
        expect {client.set({:item_code => "item_url", :quantity => 10})}.to raise_error ::YSA::AuthError
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

  describe 'set_request_body' do
    let(:seller_id) {"dummy_seller_id"}
    let(:access_token) {"dummy_access_token"}
    let(:client) {described_class.new({seller_id: seller_id, access_token: access_token})}

    context 'single item' do
      let(:param){[{item_code: 'test01', quantity: 10}]}
      subject {client.set_request_body(param)}
      it {is_expected.to eq "seller_id=#{seller_id}&item_code=test01&quantity=10"}
    end

    context 'multiple items' do
      let(:param){[{item_code: 'test02', quantity: 10}, {item_code: 'test03', quantity: 5}]}
      subject {client.set_request_body(param)}
      it {is_expected.to eq "seller_id=#{seller_id}&item_code=test02,test03&quantity=10,5"}
    end

  end
end
