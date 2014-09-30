require 'spec_helper'

describe YSA::Response::Order do
  describe '#count' do
    subject(:response) {described_class.new(fixture('order/order_count.xml').read)}
    it {is_expected.to be_a described_class}

    it 'should have the attributes of order' do
      expect(response).to respond_to(:count)
    end

    it 'should have a status of response' do
      expect(response).to respond_to(:total_results_available)
    end
  end
end
