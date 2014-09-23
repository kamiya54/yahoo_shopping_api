require 'faraday'
module YahooShoppingApi
  module Client
    class Stock
      attr_accessor :access_token, :seller_id
      def initialize(args)
        @access_token = args[:access_token]
        @seller_id = args[:seller_id]
      end

      def get(item_code)
        request = connection("get").post {|req| req.body = "seller_id=#{seller_id}&item_code=#{item_code}"}
        return ::YSA::Response::Stock::Get.new(request)
      end

      def set(item_code, quantity)
        request = connection("set").post {|req| req.body = "seller_id=#{seller_id}&item_code=#{item_code}&quantity=#{quantity}"}
        return ::YSA::Response::Stock::Set.new(request)
      end

      private
      def connection(method)
        connection = Faraday.new(:url => "https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/#{method}Stock") do |c|
          c.adapter Faraday.default_adapter
          c.headers['Authorization'] = "Bearer " + access_token
        end
      end
    end
  end
end
