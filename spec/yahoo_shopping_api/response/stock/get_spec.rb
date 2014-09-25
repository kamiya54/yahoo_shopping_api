require 'spec_helper'

describe YSA::Response::Stock::Get do
  context 'an item' do
    subject {described_class.new(fixture('stock/get.xml').read)}
    it {is_expected.to be_a described_class}
    it {is_expected.to respond_to(:item_code)}
    it {is_expected.to respond_to(:quantity)}
  end

  context 'items' do
    subject {described_class.new(fixture('stock/get_array.xml').read)}
    it "should be an Array of Response::Result" do
      expect(subject).to be_a Array
      expect(subject).to respond_to(:each)
      expect(subject[0]).to respond_to(:item_code)
    end
  end
end
