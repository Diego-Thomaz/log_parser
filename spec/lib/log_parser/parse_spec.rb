# frozen_string_literal: true

require 'spec_helper'

RSpec.describe LogParser::Parse do
  describe '#call' do
    subject(:parse_log) { described_class.new(file_path, options).call }

    let(:file_path) { 'myfile.log' }
    let(:options) { nil }
    let(:log_reader) { instance_spy('LogParser::LogReader') }
    let(:result_printer) { instance_spy('LogParser::ResultPrinter') }

    before do
      allow(LogParser::LogReader).to receive(:new).with(file_path).and_return(log_reader)
      allow(LogParser::ResultPrinter).to receive(:new).with(log_reader, options).and_return(result_printer)
      parse_log
    end

    it { expect(LogParser::LogReader).to have_received(:new).with(file_path) }
    it { expect(log_reader).to have_received(:call).once }

    it { expect(LogParser::ResultPrinter).to have_received(:new).with(log_reader, options) }
    it { expect(result_printer).to have_received(:print).once }
  end
end
