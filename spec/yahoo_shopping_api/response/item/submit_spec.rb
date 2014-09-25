require 'spec_helper'

describe YSA::Response::Item::Submit do
  describe 'initialize' do
    context 'with invalid arguments' do
      subject{lambda{described_class.new(Array.new)}}
      it {is_expected.to raise_error ArgumentError}
    end
  end

  context 'access success' do
    subject {described_class.new(fixture('item/submit.xml').read)}
    it {is_expected.to respond_to(:status)}
  end
end
