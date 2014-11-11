require File.expand_path('../links', __FILE__)

module KISSmetrics
  module Client
    module Response
      class LinkHeader
        InvalidLinkHeaderError = Class.new(StandardError)

        def initialize(header=nil)
          @header       = header.to_s
          @link_records = []
        end

        def links
          return @links if @links

          extract!

          @links = KISSmetrics::Client::Response::Links.new(@link_records)
        end

        def links?
          self.links.any?
        end

        private
        def extract!
          if @header
            parts = @header.split(',')

            parts.each do |part|
              section = part.split(';')

              raise InvalidLinkHeaderError.new('Invalid Link Header') if section.size != 3

              url        = section[0].gsub(/<(.*)>/, '\1').strip
              rel        = section[1].gsub(/rel="(.*)"/, '\1').strip
              templated  = section[2].gsub(/templated="(.*)"/, '\1').strip

              @link_records << { 'href' => url, 'rel' => rel, 'templated' => templated }
            end
          end

          @link_records
        end
      end
    end
  end
end
