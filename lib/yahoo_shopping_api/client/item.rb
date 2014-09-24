module YahooShoppingApi
  module Client
    class Item
      attr_accessor :access_token, :seller_id
      Endpoint = "https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/"

      def initialize(args)
        @access_token = args[:access_token]
        @seller_id = args[:seller_id]
      end
  
      def get(item_code)
        request = connection("get").post {|req| req.body = "seller_id=#{seller_id}&item_code=#{item_code}"}
        return ::YSA::Response::Item::Get.new(request)
      end
  
      def edit(args={})
        request = connection("edit").post {|req| req.body = params(args)}
        return ::YSA::Response::Item::Edit.new(request)
      end
  
      def delete(item_code)
        request = connection("delete").post {|req| req.body = "seller_id=#{seller_id}&item_code=#{item_code}"}
        return ::YSA::Response::Item::Delete.new(request)
      end
  
      def submit(item_code)
        request = connection("submit").post {|req| req.body = "seller_id=#{seller_id}&item_code=#{item_code}"}
        return ::YSA::Response::Item::Submit.new(request)
      end
  
      private
      def connection(method)
        connection = Faraday.new(:url => Endpoint + method.to_s + "Item") do |c|
          c.adapter Faraday.default_adapter
          c.headers['Authorization'] = "Bearer " + access_token
        end
      end

      def params(args)
        str = ""
        args.each do |key, value|
          str = str + key.to_s + "=" + value.to_s + "&"
        end
        return str
      end
    end
  end
end
