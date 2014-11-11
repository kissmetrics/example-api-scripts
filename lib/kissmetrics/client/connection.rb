require 'faraday_middleware'
require 'delegate'

module KISSmetrics
  module Client
    class Connection < SimpleDelegator

      def initialize(url, &block)
        @_client = Faraday.new(url, &block)
      end

      def __getobj__
        @_client
      end

      def __setobj__(obj)
        @_client = obj
      end
    end
  end
end
