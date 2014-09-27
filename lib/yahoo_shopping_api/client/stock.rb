require 'faraday'

module YahooShoppingApi
  module Client
    class Stock < Helper
      def initialize(args)
        super
      end

      def get(args)
        Response::Stock.new post('getStock', args)
      end

      def set(args)
        Response::Stock.new post('setStock', args)
      end
    end
  end
end
