module YahooShoppingApi
  module Client
    class Item < Helper
      def initialize(args)
        super
      end

      def get(item_code)
        request = conn.post {|req| req.body = body(item_code)}
        raise AuthError if request.status == 401
        Response::Item::Get.new(request.body)
      end
  
      def edit(args={})
        request = conn.post {|req| req.body = body(args)}
        raise AuthError if request.status == 401
        Response::Item::Edit.new(request.body)
      end
  
      def delete(item_code)
        request = conn.post {|req| req.body = body(item_code)}
        raise AuthError if request.status == 401
        Response::Item::Delete.new(request.body)
      end
  
      def submit(item_code)
        request = conn.post {|req| req.body = body(item_code)}
        raise AuthError if request.status == 401
        Response::Item::Submit.new(request.body)
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
