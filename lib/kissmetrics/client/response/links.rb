require File.expand_path('../link', __FILE__)

module KISSmetrics
  module Client
    module Response
      class Links
        include Enumerable

        LinkNotFoundError = Class.new(StandardError)

        def initialize(collection)
          @collection = Array(collection)
        end

        def each(&block)
          links_collection.each(&block)
        end

        def find_by_rel(rel)
          self.select { |record| record.rel == rel.to_s }.first
        end

        def find_by_rel!(rel)
          record = self.find_by_rel(rel)
          raise LinkNotFoundError.new(("Link not found with relationship '%s'" % [rel])) unless record
          record
        end

        private
        def links_collection
          @collection.map { |record| Link.new(record) }
        end
      end
    end
  end
end
