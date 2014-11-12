module KISSmetrics
  module Client
    module Models
      class LinkRelationship
        include Comparable

        MissingNameError = Class.new(StandardError)

        def initialize(attributes={})
          @attributes = attributes
        end

        def <=>(other)
          self.name <=> other.name
        end

        def name
          @attributes.fetch('name') { raise MissingNameError.new }
        end

        def description
          @attributes['description']
        end
      end
    end
  end
end
