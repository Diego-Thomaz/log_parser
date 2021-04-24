# frozen_string_literal: true

require_relative '../lib/log_parser'

# ARGV[0] - File_path
# ARGV[1] - parameter -u to show unique visits

LogParser::Parse.new(ARGV[0], ARGV[1]).call
