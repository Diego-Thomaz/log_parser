# frozen_string_literal: true

module LogParser
  module PageVisits
    class Base
      def initialize(entries)
        @entries = entries
      end

      def call
        sort_entries
      end

      private

      attr_reader :entries

      def sort_entries
        group_entries.sort_by { |data| data[:total_visits] }.reverse!
      end

      def group_entries
        entries.group_by(&:url).map do |url, ocorrences|
          { url: url, total_visits: page_visit_counter(ocorrences) }
        end
      end
    end
  end
end
