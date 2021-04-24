module LogParser
  class ResultPrinter
    def initialize(entries, option)
      @entries = entries
      @option = option
    end

    def print
      report_klass = show_unique? ? LogParser::PageVisits::TotalUniqVisits : LogParser::PageVisits::TotalVisits
      print_visits(report_klass: report_klass)
    end

    private

    attr_reader :option, :entries

    def show_unique?
      symbolize_option == :u
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
