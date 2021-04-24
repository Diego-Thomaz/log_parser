# frozen_string_literal: true

require_relative '../lib/log_parser'

# ARGV[0] - File_path
LogParser::Parse.new(ARGV[0]).call
