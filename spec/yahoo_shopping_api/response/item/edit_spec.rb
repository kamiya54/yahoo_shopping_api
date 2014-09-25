require 'spec_helper'
describe YSA::Response::Item::Edit do
  describe 'initialize' do
    context 'with invalid arguments' do
      subject{lambda{YSA::Response::Item::Edit.new(Array.new)}}
      it {is_expected.to raise_error ArgumentError}
    end
  end

  context 'access success' do
    subject {described_class.new(fixture('item/edit_success.xml').read)}
    it {is_expected.to respond_to(:status)}
  end
end
