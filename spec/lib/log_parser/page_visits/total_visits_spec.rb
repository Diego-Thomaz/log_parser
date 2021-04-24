# frozen_string_literal: true

require 'spec_helper'
require 'ostruct'

RSpec.describe LogParser::PageVisits::TotalVisits do
  subject(:total_visits) { described_class.new(entries).call }

  let(:entries) do
    [
      OpenStruct.new(url: '/home', ip: '126.318.230.038'),
      OpenStruct.new(url: '/home', ip: '186.318.135.224'),
      OpenStruct.new(url: '/index', ip: '186.110.135.244'),
      OpenStruct.new(url: '/about', ip: '126.233.035.097')
    ]
  end

  let(:expected_result) do
    [
      { url: '/home', total_visits: 2 },
      { url: '/about', total_visits: 1 },
      { url: '/index', total_visits: 1 }
    ]
  end

  it { is_expected.to eq(expected_result) }
end
