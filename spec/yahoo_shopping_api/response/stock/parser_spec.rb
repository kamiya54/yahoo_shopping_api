require 'spec_helper'
describe YSA::Response::Stock::Parser do
  context 'with Non-XML argument' do
    it "" do
      expect{described_class.new(Array.new)}.to raise_error ArgumentError
    end
  end
end
