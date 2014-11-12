require File.expand_path('../metric', __FILE__)

module KISSmetrics
  module Client
    module Models
      class Metrics
        include Enumerable

        def initialize(collection)
          @collection = Array(collection)
        end

        def each(&block)
          metrics_collection.each(&block)
        end

        private
        def metrics_collection
          @collection.map { |record| Metric.new(record) }
        end
      end
    end
  end
end
