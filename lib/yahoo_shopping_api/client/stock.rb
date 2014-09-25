require 'faraday'
module YahooShoppingApi
  module Client
    class Stock < Helper
      def initialize(args)
        super
      end

      def get(item_code)
        request = conn.post {|req| req.body = request_body(item_code)}
        raise AuthError if request.status == 401
        Response::Stock::Get.new(request.body)
      end

      def set(args={})
        request = conn.post {|req| req.body = request_body(args)}
        raise AuthError if request.status == 401
        Response::Stock::Set.new(request.body)
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
