# frozen_string_literal: true

module LogParser
  module PageVisits
    class AverageTotalVisits < Base
      class << self
        def title
          'AVERAGE TOTAL VISITS'
        end
      end
      private

      def page_visit_counter(ocorrences)
        ocorrences.count / ocorrences.uniq.count
      end
    end
  end
end
