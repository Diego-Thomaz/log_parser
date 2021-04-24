# frozen_string_literal: true

module LogParser
  Entries = Struct.new(:url, :ip)

  class LogReader
    def initialize(log_file)
      @log_file = log_file
      @entries = []
    end

    def call
      read
    end

    private

    attr_reader :log_file, :entries

    def read
      raise Errno::ENOENT if log_file.nil?

      File.new(log_file).each_line do |line|
        entries << log_entries(line)
      end

      entries
    rescue Errno::ENOENT
      abort 'file does not exist!'
    end

    def log_entries(line)
      url, ip = line.split(' ')
      Entries.new(url, ip)
    end
  end
end
