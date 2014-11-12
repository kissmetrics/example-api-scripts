require File.expand_path('../../response/links', __FILE__)

module KISSmetrics
  module Client
    module Models
      class Event
        include Comparable

        # @param attributes [Hash] the event's attributes
        def initialize(attributes={})
          @attributes = attributes
        end

        def <=>(other)
          self.total <=> other.total
        end

        # @return [String]
        def id
          @attributes['id']
        end

        # @return [KISSmetrics::Client::Response::Links]
        def links
          KISSmetrics::Client::Response::Links.new(@attributes.fetch('links', []))
        end

        # @return [String]
        def index
          @attributes['index']
        end

        # @return [String]
        def product_id
          @attributes['product_id']
        end

        # @return [String]
        def name
          @attributes['name']
        end

        # @return [String]
        def display_name
          @attributes['display_name']
        end

        # @return [String]
        def description
          @attributes['description']
        end

        # @return [TrueClass] if the event is visible
        def is_visible
          @attributes['is_visible']
        end
        alias :visible? :is_visible

        # @return [Fixnum]
        def total
          @attributes.fetch('total', '0').to_i
        end

        # @return [DateTime]
        def first_used_at
          DateTime.parse(@attributes.fetch('first_used_at', nil).to_s)
        rescue ArgumentError
          nil
        end

        # @return [DateTime]
        def last_used_at
          DateTime.parse(@attributes.fetch('last_used_at', nil).to_s)
        rescue ArgumentError
          nil
        end

        # @return [DateTime]
        def first_sent_at
          DateTime.parse(@attributes.fetch('first_sent_at', nil).to_s)
        rescue ArgumentError
          nil
        end

        # @return [DateTime]
        def last_sent_at
          DateTime.parse(@attributes.fetch('last_sent_at', nil).to_s)
        rescue ArgumentError
          nil
        end
      end
    end
  end
end
