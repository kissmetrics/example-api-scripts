require File.expand_path('../../response/links', __FILE__)

module KISSmetrics
  module Client
    module Models
      class Report
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

        def account_id
          @attributes['account_id']
        end

        def report_type
          @attributes['report_type']
        end

        def name
          @attributes['name']
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
