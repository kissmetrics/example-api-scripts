require File.expand_path('../../response/links', __FILE__)

module KISSmetrics
  module Client
    module Models
      class Directory

        # Create a Directory object. This object
        # will return information about how you can
        # move around the KISSmetrics API.
        #
        # @example
        #   request = KISSmeetrics::Client::Directory.new(directory_response)
        #
        # @return [KISSmetrics::Client::Models::Directory] The Directory object
        def initialize(attributes={})
          @attributes = attributes
        end

        # This returns the name of the API
        #
        # @return [String,nil] Name of the API
        def name
          @attributes['name']
        end

        # This returns a brief description of the API
        #
        # @return [String,nil] Description of the API
        def description
          @attributes['description']
        end

        # This returns a collection of links. These links
        # can then be used to make subsequent requests
        # for their corresponding resources.
        #
        # @return [KISSmetrics::Client::Response::Links] An array object of links
        def links
          KISSmetrics::Client::Response::Links.new(@attributes.fetch('links', []))
        end

        # This returns true or false depending on the
        # `links` collection.
        #
        # @return [Boolean]
        def links?
          self.links.any?
        end
      end
    end
  end
end
