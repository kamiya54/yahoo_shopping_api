require 'faraday'

module YahooShoppingApi
  module Client
    class Stock < Helper
      def initialize(args)
        super
      end

      def get(item_code)
        request = conn.post {|req| req.body = get_request_body(item_code)}
        raise AuthError if request.status == 401
        Response::Stock::Get.new(request.body)
      end

      def set(args={})
        request = conn.post {|req| req.body = set_request_body(args)}
        raise AuthError if request.status == 401
        Response::Stock::Set.new(request.body)
      end

      def conn
        connection = Faraday.new(:url => Endpoint + caller[0][/`([^']*)'/, 1] + 'Stock') do |c|
          c.adapter Faraday.default_adapter
          c.headers['Authorization'] = "Bearer " + access_token
        end
      end
  
      def get_request_body(args)
        if args.class == Array
          return "seller_id=#{seller_id}&item_code=#{args.join(",")}"
        else
          return "seller_id=#{seller_id}&item_code=#{args}"
        end
      end

      def set_request_body(args)
        str = "seller_id=#{seller_id}"
        if args.class == Array
          args[0].each {|key, value| str << "&#{key}=" + args.collect {|e| e[key.to_sym]}.join(',')}
          return str
        else
          args.each {|key, value| str = str + key.to_s + "=" + value.to_s + "&" }
          return str
        end
      end
    end
  end
end
