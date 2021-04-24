module LogParser
  module PageVisits
    class TotalUniqVisits < Base
      class << self
        def title
          'TOTAL UNIQUE VISITS'
        end
      end

      private

      def page_visit_counter(ocorrences)
        ocorrences.uniq.count
      end
    end
  end
end
