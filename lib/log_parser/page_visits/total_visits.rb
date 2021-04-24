# frozen_string_literal: true

module LogParser
  module PageVisits
    class TotalVisits < Base
      class << self
        def title
          'TOTAL VISITS'
        end
      end

      private

      def page_visit_counter(ocorrences)
        ocorrences.count
      end
    end
  end
end
