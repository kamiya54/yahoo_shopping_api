require 'spec_helper'
describe YSA::Client::Helper do
  let(:seller_id) {'dummy_seller_id'}
  let(:access_token) {'dummy_access_token'}
  let(:request) {described_class.new(seller_id: seller_id, access_token: access_token)}

  describe 'http request' do
    describe 'with invalid accesstoken' do
      let(:endpoint) {"https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/setStock"}
      before {stub_request(:post, endpoint).to_return(:status => 401, body: fixture('timeout.xml'))}
      it '' do
        expect{request.post('setStock', '')}.to raise_error ::YSA::AuthError
      end
    end
  end

  describe 'request_body' do
    context 'with hash argument' do
      let(:param) {{item_code: 'item1', quantity: 10}}
      let(:converted) {"seller_id=#{seller_id}&item_code=item1&quantity=10"}
      it 'should convert params properly' do
        expect(request.request_body(param)).to eq converted
      end
    end

    context 'with array argument' do
      let(:param) {['item1', 'item2']}
      let(:converted) {"seller_id=#{seller_id}&item_code=item1,item2"}
      it 'should convert params properly' do
        expect(request.request_body(param)).to eq converted
      end
    end

    context 'with 1code argument' do
      let(:param) {'item1'}
      let(:converted) {"seller_id=#{seller_id}&item_code=item1"}
      it 'should convert params properly' do
        expect(request.request_body(param)).to eq converted
      end
    end

    context 'with hash-array argument' do
      let(:param) {[{item_code: 'item1', quantity: 10}, {item_code: 'item2', quantity: 11}]}
      let(:converted) {"seller_id=#{seller_id}&item_code=item1,item2&quantity=10,11"}
      it 'should convert params properly' do
        expect(request.request_body(param)).to eq converted
      end
    end
  end
end
