require File.expand_path('../event', __FILE__)

module KISSmetrics
  module Client
    module Models
      class Events
        include Enumerable

        def initialize(collection)
          @collection = Array(collection)
        end

        def each(&block)
          events_collection.each(&block)
        end

        private
        def events_collection
          @collection.map { |record| Event.new(record) }
        end
      end
    end
  end
end
