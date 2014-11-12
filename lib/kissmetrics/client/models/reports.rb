require File.expand_path('../report', __FILE__)

module KISSmetrics
  module Client
    module Models
      class Reports
        include Enumerable

        def initialize(collection)
          @collection = Array(collection)
        end

        def each(&block)
          reports_collection.each(&block)
        end

        private
        def reports_collection
          @collection.map { |record| Report.new(record) }
        end
      end
    end
  end
end

