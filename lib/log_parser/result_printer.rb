# frozen_string_literal: true

module LogParser
  class ResultPrinter
    def initialize(entries, option)
      @entries = entries
      @option = option
    end

    def print
      print_visits(report_klass: pick_up_correct_report)
    end

    private

    attr_reader :option, :entries

    def pick_up_correct_report
      return LogParser::PageVisits::TotalUniqVisits if show_unique?
      return LogParser::PageVisits::AverageTotalVisits if average_report?

      LogParser::PageVisits::TotalVisits
    end

    def show_unique?
      symbolize_option == :u
    end

    def average_report?
      symbolize_option == :a
    end

    def print_visits(report_klass:)
      results = report_klass.title
      report_klass.new(entries).call.each do |hash_result|
        results = "#{results}\n#{hash_result[:url]} -> #{hash_result[:total_visits]}"
      end
      puts results
      results
    end

    def symbolize_option
      return false if option.nil?

      option.scan(/[[:alpha:]]/).first.to_sym
    end
  end
end
