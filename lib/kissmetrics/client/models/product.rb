require File.expand_path('../../response/links', __FILE__)

module KISSmetrics
  module Client
    module Models
      class Product
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

        def name
          @attributes['name']
        end

        def account_id
          @attributes['account_id']
        end

        def url
          @attributes['url']
        end

        def status
          @attributes['status']
        end

        def environment
          @attributes['environment']
        end

        def timezone
          @attributes['timezone']
        end

        def created_at
          begin
            DateTime.parse(@attributes.fetch('created_at', ''))
          rescue ArgumentError
            nil
          end
        end
      end
    end
  end
end
