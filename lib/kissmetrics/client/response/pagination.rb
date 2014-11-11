module KISSmetrics
  module Client
    module Response
      class Pagination

        def initialize(attributes={})
          @attributes = attributes
        end

        def total
          @attributes.fetch('total', 0).to_i
        end

        def offset
          @attributes.fetch('offset', 0).to_i
        end

        def limit
          @attributes.fetch('limit', 0).to_i
        end

        def pages
          if (self.offset + self.limit) > self.total
            1
          else
            ((self.total - self.offset)/self.limit).ceil
          end
        end
      end
    end
  end
end
