require 'spec_helper'

describe Codelog::Output::ReleaseFile do
  let(:file_content) { 'test' }
  let(:file_path) { 'codus/codelog'}
  let(:mocked_file) { double }

  describe '#print' do
    subject { described_class.new.print(file_content, file_path) }
    before(:each) do
      allow(File).to receive(:open).and_yield(mocked_file)
      allow(mocked_file).to receive(:puts)
    end

    it 'prints the passed content in a file on the passed path' do
      subject

      expect(File).to have_received(:open).with(file_path, 'a')
      expect(mocked_file).to have_received(:puts).with(file_content)
    end
  end
end
