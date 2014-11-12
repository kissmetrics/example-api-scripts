require File.expand_path('../property', __FILE__)

module KISSmetrics
  module Client
    module Models
      class Properties
        include Enumerable

        def initialize(collection)
          @collection = Array(collection)
        end

        def each(&block)
          properties_collection.each(&block)
        end

        private
        def properties_collection
          @collection.map { |record| Property.new(record) }
        end
      end
    end
  end
end
