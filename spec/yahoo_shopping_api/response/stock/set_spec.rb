require 'spec_helper'

describe YSA::Response::Stock::Set do
  context 'Update one item' do
    subject(:response) {described_class.new(fixture('stock/set.xml').read)}
    it {is_expected.to be_a described_class}

    it "should have the attributes of item" do
      expect(response).to respond_to(:item_code)
      expect(response).to respond_to(:quantity)
    end

    it "should have a status of response" do
      expect(response).to respond_to(:total_results_available)
    end
  end

  context 'Update multiple items' do
    subject(:response) {described_class.new(fixture('stock/set_array.xml').read)}
    it {is_expected.to be_a Array}

    it "should have the attributes of item" do
      expect(response[0]).to respond_to(:item_code)
      expect(response[0]).to respond_to(:quantity)
    end

    it "should have a status of response" do
      expect(response).to respond_to(:total_results_available)
    end
  end
end
