# frozen_string_literal: true

require 'spec_helper'

RSpec.describe LogParser::Parse do
  describe '#call' do
    subject(:parse_log) { described_class.new(file_path).call }

    let(:file_path) { 'myfile.log' }
    let(:log_reader) { instance_spy('LogParser::LogReader') }

    before do
      allow(LogParser::LogReader).to receive(:new).with(file_path).and_return(log_reader)
      parse_log
    end

    it { expect(LogParser::LogReader).to have_received(:new).with(file_path) }
    it { expect(log_reader).to have_received(:call).once }
  end
end
