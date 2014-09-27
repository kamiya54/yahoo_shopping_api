require 'spec_helper'
describe YSA::Response::Item do
  describe '#get' do
    subject {described_class.new(fixture('item/get.xml').read)}
    it('should have a status of response') {is_expected.to respond_to(:total_results_returned)}
    it('should have the attributes of item') {is_expected.to respond_to(:item_code)}
  end

  describe '#edit' do
    context 'Success' do
      subject {described_class.new(fixture('item/edit_success.xml').read)}
      it('should have a status of response') {is_expected.to respond_to(:status)}
    end

    context 'Warning' do
      subject {described_class.new(fixture('item/edit_warning.xml').read)}
      it('should have a status of response') {is_expected.to respond_to(:warning)}
    end

    context 'Error' do
      subject {described_class.new(fixture('item/edit_error.xml').read)}
      it('should have a status of response') {is_expected.to respond_to(:error)}
    end
  end

  describe '#delete' do
    subject {described_class.new(fixture('item/delete.xml').read)}
    it('should have a status of response') {is_expected.to respond_to(:status)}
  end

  describe '#submit' do
    subject {described_class.new(fixture('item/submit.xml').read)}
    it('should have a status of response') {is_expected.to respond_to(:status)}
  end
end
