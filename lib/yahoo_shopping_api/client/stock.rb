require 'faraday'
module YahooShoppingApi
  module Client
    class Stock < Helper
      def initialize(args)
        super
      end

      def get(item_code)
        Response::Stock::Get.new(conn.post {|req| req.body = body(item_code)})
      end

      def set(args={})
        Response::Stock::Set.new(conn.post {|req| req.body = body(args)})
      end

      private
      def conn
        connection = Faraday.new(:url => Endpoint + caller[0][/`([^']*)'/, 1] + 'Stock') do |c|
          c.adapter Faraday.default_adapter
          c.headers['Authorization'] = "Bearer " + access_token
        end
      end
    end
  end
end
