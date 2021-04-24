# frozen_string_literal: true

require 'spec_helper'

RSpec.describe LogParser::LogReader do
  describe '#call' do
    subject(:log_reader) { described_class.new(file_path).call }

    context 'when file exists' do
      let(:file_path) { 'spec/fixtures/webserver.log' }

      it { expect(log_reader.entries.count).to eq(6) }
      it { expect(log_reader.entries.map(&:class).uniq).to match([LogParser::Entries]) }
    end

    context 'when it fails to read a file' do
      shared_examples 'file does not exist!' do
        it { expect { log_reader }.to raise_error(SystemExit, 'file does not exist!') }
      end

      context 'when no file is passed' do
        let(:file_path) { nil }

        it_behaves_like 'file does not exist!'
      end

      context 'when an inexistent file is passed' do
        let(:file_path) { 'fixtures/no_file.log' }

        it_behaves_like 'file does not exist!'
      end
    end
  end
end
