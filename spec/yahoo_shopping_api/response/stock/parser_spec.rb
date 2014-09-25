require 'spec_helper'
describe YSA::Response::Stock::Parser do
  context 'with Non-XML argument' do
    it "" do
      expect{described_class.new(Array.new)}.to raise_error ArgumentError
    end
  end

  describe "attributes" do
    subject {described_class.new(fixture('stock/get.xml').read).item_code}
    it {is_expected.not_to be_a Array}
  end
end
