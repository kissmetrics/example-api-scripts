require File.expand_path('../../response/links', __FILE__)

module KISSmetrics
  module Client
    module Models
      class Metric
        include Comparable

        def initialize(attributes={})
          @attributes = attributes
        end

        def <=>(other)
          self.sort_index <=> other.sort_index
        end

        def id
          @attributes['id']
        end

        def links
          KISSmetrics::Client::Response::Links.new(@attributes.fetch('links', []))
        end

        def product_id
          @attributes['product_id']
        end

        def title
          @attributes['title']
        end

        def description
          @attributes['description']
        end

        def unit_type
          @attributes['unit_type']
        end

        def status
          @attributes['status']
        end

        def sort_index
          @attributes.fetch('sort_index', 0).to_i
        end

        def is_visible
          @attributes['is_visible']
        end
        alias :visible? :is_visible

        def color
          @attributes['color']
        end

        def config_last_changed_at
          begin
            DateTime.parse(@attributes.fetch('config_last_changed_at', nil).to_s)
          rescue ArgumentError
            nil
          end
        end
      end
    end
  end
end
