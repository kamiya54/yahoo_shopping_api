module YahooShoppingApi
  module Client
    class Item < Helper
      def initialize(args)
        super
      end

      def get(item_code)
        Response::Item::Get.new(conn.post {|req| req.body = body(item_code)})
      end
  
      def edit(args={})
        Response::Item::Edit.new(conn.post {|req| req.body = body(args)})
      end
  
      def delete(item_code)
        Response::Item::Delete.new(conn.post {|req| req.body = body(item_code)})
      end
  
      def submit(item_code)
        Response::Item::Submit.new(conn.post {|req| req.body = body(item_code)})
      end

      private
      def conn
        connection = Faraday.new(:url => Endpoint + caller[0][/`([^']*)'/, 1] + 'Item') do |c|
          c.adapter Faraday.default_adapter
          c.headers['Authorization'] = "Bearer " + access_token
        end
      end
    end
  end
end
