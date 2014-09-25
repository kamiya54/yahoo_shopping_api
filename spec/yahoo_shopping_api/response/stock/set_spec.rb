require 'spec_helper'

describe YSA::Response::Stock::Set do
  context 'access success' do
    subject {described_class.new(fixture('stock/set.xml').read)}
    it {is_expected.to respond_to(:item_code)}
    it {is_expected.to respond_to(:quantity)}
  end
end
