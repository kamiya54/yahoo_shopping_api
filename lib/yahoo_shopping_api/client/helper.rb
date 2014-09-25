module YahooShoppingApi
  module Client
    class Helper
      attr_accessor :access_token, :seller_id
      Endpoint = "https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/"

      def initialize(args)
        @access_token = args[:access_token]
        @seller_id = args[:seller_id]
      end
  
      def request_body(args)
        if args.class == Hash
          str = "seller_id=#{seller_id}&"
          args.each {|key, value| str = str + key.to_s + "=" + value.to_s + "&" }
          return str
        elsif args.class == Array
          return "seller_id=#{seller_id}&item_code=#{args.join(",")}"
        else
          return "seller_id=#{seller_id}&item_code=#{args}"
        end
      end
    end
  end
end
