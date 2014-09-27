module YahooShoppingApi
  module Client
    class Helper
      attr_accessor :access_token, :seller_id
      Endpoint = "https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/"

      def initialize(args)
        @access_token = args[:access_token]
        @seller_id = args[:seller_id]
      end

      def post(method, args)
        request = connection(method).post {|req| req.body = request_body(args)}
        raise AuthError if request.status == 401
        return request.body
      end

      def request_body(args)
        if args.class == Array
          if args[0].class == Hash
            array_hash(args)
          else
            array(args)
          end
        elsif args.class == Hash
          hash(args)
        else
          code(args)
        end
      end

      private

      def connection(method)
        connection = Faraday.new(:url => Endpoint + method) do |c|
          c.adapter Faraday.default_adapter
          c.headers['Authorization'] = "Bearer " + access_token
        end
      end

      def array_hash(args)
        str = "seller_id=#{seller_id}"
        args[0].each {|key, value| str << "&#{key}=" + args.collect{|e| e[key.to_sym]}.join(',')}
        return str
      end

      def hash(args)
        str = "seller_id=#{seller_id}"
        args.each {|key, value| str << "&" + key.to_s + "=" + value.to_s }
        return str
      end

      def array(args)
        return "seller_id=#{seller_id}&item_code=#{args.join(",")}"
      end

      def code(args)
        return "seller_id=#{seller_id}&item_code=#{args}"
      end
    end
  end
end
