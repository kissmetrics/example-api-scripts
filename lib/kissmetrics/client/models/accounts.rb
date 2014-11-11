require File.expand_path('../account', __FILE__)

module KISSmetrics
  module Client
    module Models
      class Accounts
        include Enumerable

        def initialize(collection)
          @collection = Array(collection)
        end

        def each(&block)
          accounts_collection.each(&block)
        end

        private
        def accounts_collection
          @collection.map { |record| Account.new(record) }
        end
      end
    end
  end
end
