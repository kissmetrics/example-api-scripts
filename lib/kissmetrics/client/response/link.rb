require 'addressable/template'

module KISSmetrics
  module Client
    module Response
      class Link
        include Comparable

        MissingLinkRelationshipError = Class.new(StandardError)
        MissingHrefError             = Class.new(StandardError)

        def initialize(attributes={})
          @attributes = attributes
        end

        def <=>(other)
          self.rel <=> other.rel
        end

        def href
          @attributes.fetch('href') { raise MissingHrefError.new }
        end

        def rel
          @attributes.fetch('rel') { raise MissingLinkRelationshipError.new }
        end

        def url_for(options={})
          if self.templated?
            template = Addressable::Template.new(self.href)
            template = template.expand(options)
            template.to_s
          else
            self.href
          end
        end

        def name
          @attributes['name']
        end

        def templated
          @attributes.fetch('templated', false)
        end
        alias :templated? :templated
      end
    end
  end
end

