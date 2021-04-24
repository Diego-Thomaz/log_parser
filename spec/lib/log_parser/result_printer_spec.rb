# frozen_string_literal: true

require 'spec_helper'
require 'ostruct'

RSpec.describe LogParser::ResultPrinter do
  describe '#call' do
    subject(:result_printer) { described_class.new(entries, options).print }

    let(:entries) { [] }

    shared_examples 'print total visits' do
      let(:page_visits) { instance_spy('LogParser::PageVisits::TotalVisits') }
      let(:page_visits_hash) do
        [
          { url: '/home', total_visits: 2 },
          { url: '/about', total_visits: 1 },
          { url: '/index', total_visits: 1 }
        ]
      end
      let(:expected_result) do
        "TOTAL VISITS\n/home -> 2\n/about -> 1\n/index -> 1"
      end

      before do
        allow(LogParser::PageVisits::TotalVisits).to receive(:new).with(entries).and_return(page_visits)
        allow(page_visits).to receive(:call).and_return(page_visits_hash)
        result_printer
      end

      it { expect(LogParser::PageVisits::TotalVisits).to have_received(:new) }
      it { expect(page_visits).to have_received(:call) }
      it { is_expected.to eq(expected_result) }
    end

    context 'when no option is passed' do
      let(:options) { nil }

      it_behaves_like 'print total visits'
    end

    context 'when an option is passed but it is not -u' do
      let(:options) { '-p' }

      it_behaves_like 'print total visits'
    end

    context 'when -u option is passed' do
      let(:page_uniq_visits) { instance_spy('LogParser::PageVisits::TotalUniqVisits') }
      let(:options) { '-u' }
      let(:page_visits_hash) do
        [
          { url: '/home', total_visits: 1 },
          { url: '/about', total_visits: 1 },
          { url: '/index', total_visits: 1 }
        ]
      end
      let(:expected_result) do
        "TOTAL UNIQUE VISITS\n/home -> 1\n/about -> 1\n/index -> 1"
      end

      before do
        allow(LogParser::PageVisits::TotalUniqVisits).to receive(:new).with(entries).and_return(page_uniq_visits)
        allow(page_uniq_visits).to receive(:call).and_return(page_visits_hash)
        result_printer
      end

      it { expect(LogParser::PageVisits::TotalUniqVisits).to have_received(:new) }
      it { expect(page_uniq_visits).to have_received(:call) }
      it { is_expected.to eq(expected_result) }
    end
  end
end
