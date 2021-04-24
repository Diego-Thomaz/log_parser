# frozen_string_literal: true

require_relative '../log_parser'

module LogParser
  class Parse
    attr_reader :log_file, :options

    def initialize(log_file, options = nil)
      @log_file = log_file
      @options = options
    end

    def call(reader = LogParser::LogReader)
      entries = reader.new(log_file).call
      LogParser::ResultPrinter.new(entries, options).print
    end
  end
end
