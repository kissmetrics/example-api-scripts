require File.expand_path('../link_relationships', __FILE__)

module KISSmetrics
  module Client
    module Models
      class Rels

        def initialize(attributes={})
          @attributes = attributes
        end

        def title
          @attributes['title']
        end

        def description
          @attributes['description']
        end

        def rels
          KISSmetrics::Client::Models::LinkRelationships.new(@attributes.fetch('rels', []))
        end

        def rels?
          self.rels.any?
        end
      end
    end
  end
end
