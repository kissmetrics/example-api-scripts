require File.expand_path('../../response/links', __FILE__)

module KISSmetrics
  module Client
    module Models
      class Property
        include Comparable

        def initialize(attributes={})
          @attributes = attributes
        end

        def <=>(other)
          self.name <=> other.name
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

        def name
          @attributes['name']
        end

        def display_name
          @attributes['display_name']
        end

        def description
          @attributes['description']
        end

        def index
          @attributes['index']
        end

        def type
          @attributes['type']
        end

        def is_visible
          @attributes['is_visible']
        end
        alias :visible? :is_visible

        def first_used_at
          begin
            DateTime.parse(@attributes.fetch('first_used_at', nil).to_s)
          rescue ArgumentError
            nil
          end
        end

        def last_used_at
          begin
            DateTime.parse(@attributes.fetch('last_used_at', nil).to_s)
          rescue ArgumentError
            nil
          end
        end

        def first_sent_at
          begin
            DateTime.parse(@attributes.fetch('first_sent_at', nil).to_s)
          rescue ArgumentError
            nil
          end
        end

        def last_sent_at
          begin
            DateTime.parse(@attributes.fetch('last_sent_at', nil).to_s)
          rescue ArgumentError
            nil
          end
        end
      end
    end
  end
end
