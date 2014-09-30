require 'yahoo_shopping_api'
require 'spec_helper'

describe YahooShoppingApi::Client::Order do
  let(:seller_id) {'dummy_seller_id'}
  let(:access_token) {'dummy_access_token'}
  let(:client) {described_class.new(:seller_id => seller_id, :access_token => access_token)}

  describe "initialize" do
    it "should keep a seller_id and access_token" do
      expect(client.seller_id).to eq seller_id
      expect(client.access_token).to eq access_token
    end
  end

  describe "#count" do
    let(:endpoint) {"https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/orderCount?seller_id=#{seller_id}"}
    before {stub_request(:get, endpoint).to_return(:status => 200, body: fixture('order/order_count.xml'))}
    subject{client.count}
    it {is_expected.to be_a ::YSA::Response::Order}
  end
end
