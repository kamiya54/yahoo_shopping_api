require 'yahoo_shopping_api'
require 'spec_helper'

describe YahooShoppingApi::Client::Item do
  let(:client) {described_class.new(:seller_id => 'store', :access_token => 'dummy_access_token')}
  describe "initialize" do
    it "should have a seller_id" do
      expect(client.seller_id).to eq "store"
    end

    it "should have an access token" do
      expect(client.access_token).to eq "dummy_access_token"
    end
  end

  describe "#edit" do
    let(:endpoint) {"https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/editItem"}
    before {stub_request(:post, endpoint).to_return(:status => 200, body: fixture('item/edit_success.xml'))}
    subject{client.edit({:item_code => 'item_code', :item_price => 19800})}
    it {is_expected.to be_a ::YSA::Response::Item::Edit}
  end

  describe "#get" do
    let(:endpoint) {"https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/getItem"}
    before {stub_request(:post, endpoint).to_return(:status => 200, body: fixture('item/get.xml'))}
    subject{client.get('item_code')}
    it {is_expected.to be_a ::YSA::Response::Item::Get}
  end

  describe "#delete" do
    let(:endpoint) {"https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/deleteItem"}
    before {stub_request(:post, endpoint).to_return(:status => 200, body: fixture('item/delete.xml'))}
    subject{client.delete('item_code')}
    it {is_expected.to be_a ::YSA::Response::Item::Delete}
  end

  describe "#submit" do
    let(:endpoint) {"https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/submitItem"}
    before {stub_request(:post, endpoint).to_return(:status => 200, body: fixture('item/submit.xml'))}
    subject{client.submit('item_code')}
    it {is_expected.to be_a ::YSA::Response::Item::Submit}
  end
end
