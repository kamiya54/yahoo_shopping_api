require 'yahoo_shopping_api'
require 'spec_helper'

describe YahooShoppingApi::Client::Item do
  let(:seller_id) {'dummy_seller_id'}
  let(:access_token) {'dummy_access_token'}
  let(:client) {described_class.new(:seller_id => seller_id, :access_token => access_token)}

  describe "initialize" do
    it "should keep a seller_id and access_token" do
      expect(client.seller_id).to eq seller_id
      expect(client.access_token).to eq access_token
    end
  end

  describe "#edit" do
    let(:endpoint) {"https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/editItem"}
    before {stub_request(:post, endpoint).to_return(:status => 200, body: fixture('item/edit_success.xml'))}
    subject{client.edit({:item_code => 'item_code', :item_price => 19800})}
    it {is_expected.to be_a ::YSA::Response::Item}
  end

  describe "#get" do
    let(:endpoint) {"https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/getItem?item_code=item_code&seller_id=dummy_seller_id"}
    before {stub_request(:get, endpoint).to_return(:status => 200, body: fixture('item/get.xml'))}
    subject{client.get('item_code')}
    it {is_expected.to be_a ::YSA::Response::Item}
  end

  describe "#delete" do
    let(:endpoint) {"https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/deleteItem"}
    before {stub_request(:post, endpoint).to_return(:status => 200, body: fixture('item/delete.xml'))}
    subject{client.delete('item_code')}
    it {is_expected.to be_a ::YSA::Response::Item}
  end

  describe "#submit" do
    let(:endpoint) {"https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/submitItem"}
    before {stub_request(:post, endpoint).to_return(:status => 200, body: fixture('item/submit.xml'))}
    subject{client.submit('item_code')}
    it {is_expected.to be_a ::YSA::Response::Item}
  end
end
