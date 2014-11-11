require File.expand_path('../product', __FILE__)

module KISSmetrics
  module Client
    module Models
      class Products
        include Enumerable

        def initialize(collection)
          @collection = Array(collection)
        end

        def each(&block)
          products_collection.each(&block)
        end

        private
        def products_collection
          @collection.map { |record| Product.new(record) }
        end
      end
    end
  end
end
