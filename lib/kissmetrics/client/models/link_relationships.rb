require File.expand_path('../link_relationship', __FILE__)

module KISSmetrics
  module Client
    module Models
      class LinkRelationships
        include Enumerable

        def initialize(collection)
          @collection = Array(collection)
        end

        def each(&block)
          link_relationships_collection.each(&block)
        end

        private
        def link_relationships_collection
          @collection.map { |record| LinkRelationship.new(record) }
        end
      end
    end
  end
end
