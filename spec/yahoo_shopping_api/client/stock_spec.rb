require 'yahoo_shopping_api'
require 'spec_helper'

describe YahooShoppingApi::Client::Stock do
  let(:seller_id) {'dummy_seller_id'}
  let(:access_token) {'dummy_access_token'}
  let(:client) {described_class.new(:seller_id => seller_id, :access_token => access_token)}

  describe "initialize" do
    it "should keep a seller_id and access_token" do
      expect(client.seller_id).to eq seller_id
      expect(client.access_token).to eq access_token
    end
  end

  describe '#set' do
    let(:endpoint) {"https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/setStock"}
    before {stub_request(:post, endpoint).to_return(:status => 200, body: fixture('stock/set.xml'))}
    subject {client.set({:item_code => 'item_url', :quantity =>10})}
    it {is_expected.to be_a ::YSA::Response::Stock}
  end

  describe '#get' do
    let(:endpoint) {"https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/getStock"}
    before {stub_request(:post, endpoint).to_return(:status => 200, body: fixture('stock/get.xml'))}
    subject {client.get('item_url')}
    it {is_expected.to be_a ::YSA::Response::Stock}
  end
end
