require 'spec_helper'

describe YSA::Response::Parser do
  describe 'initialize' do
    context 'with Non-XML argument' do
      subject{lambda{described_class.new(Array.new)}}
      it {is_expected.to raise_error ArgumentError}
    end

    context 'with XML argument' do
      subject{lambda{described_class.new(fixture('item/get.xml').read)}}
      it {is_expected.not_to raise_error}
    end
  end
end
