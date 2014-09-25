require 'spec_helper'
describe YSA::Client::Helper do
  describe 'request_body' do
    let(:access_token){'dummy_access_token'}
    let(:seller_id){'dummy_seller_id'}
    let(:helper){described_class.new(:access_token => access_token, :seller_id => seller_id)}

    context 'with one item' do
      let(:body){'seller_id=' + seller_id + '&item_code=item_code'}
      subject{helper.request_body('item_code')}
      it {is_expected.to eq body}
    end

    context 'with subcode' do
      let(:body){'seller_id=' + seller_id + '&item_code=item_code:subcode'}
      subject{helper.request_body('item_code:subcode')}
      it {is_expected.to eq body}
    end

    context 'with items' do
      let(:body){'seller_id=' + seller_id + '&item_code=item1,item2'}
      subject{helper.request_body(['item1', 'item2'])}
      it {is_expected.to eq body}
    end
  end
end
