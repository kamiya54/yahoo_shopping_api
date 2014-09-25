require 'spec_helper'

describe YSA::Response::Item::Parser do
  describe 'initialize' do
    context 'with invalid argument' do
      subject{lambda{described_class.new(Array.new)}}
      it {is_expected.to raise_error ArgumentError}
    end

    context 'with XML argument' do
      subject{lambda{described_class.new(fixture('item/get.xml').read)}}
      it {is_expected.not_to raise_error}
    end
  end

  describe "attributes" do
    subject{described_class.new(fixture('item/get.xml').read).item_code}
    it {is_expected.not_to be_a Array}
  end
end
