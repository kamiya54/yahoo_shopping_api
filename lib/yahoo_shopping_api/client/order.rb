module YahooShoppingApi
  module Client
    class Order < Helper
      def initialize(args)
        super
      end

      def count()
        Response::Order.new get_request('orderCount')
      end
    end
  end
end
