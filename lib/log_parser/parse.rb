# frozen_string_literal: true

require_relative '../log_parser'

module LogParser
  class Parse
    attr_reader :log_file

    def initialize(log_file)
      @log_file = log_file
    end

    def call(reader = LogParser::LogReader)
      entries = reader.new(log_file).call
    end
  end
end
