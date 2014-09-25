require 'spec_helper'
describe YSA::Response::Item::Get do
  describe 'initialize' do
    context 'with invalid arguments' do
      subject{lambda{described_class.new(Array.new)}}
      it {is_expected.to raise_error ArgumentError}
    end
  end

  context 'access success' do
    subject {described_class.new(fixture('item/get.xml').read)}
    it {is_expected.to respond_to(:item_code)}
    it {is_expected.to respond_to(:price)}
  end
end
