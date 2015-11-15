module YahooShoppingApi
  module Client
    class Helper
      attr_accessor :access_token, :seller_id, :endpoint
      ENDPOINT = "https://circus.shopping.yahooapis.jp/ShoppingWebService/V1/"
      TEST_ENDPOINT = "https://test.circus.shopping.yahooapis.jp/ShoppingWebService/V1/"

      def initialize(args)
        @access_token = args[:access_token]
        @seller_id = args[:seller_id]
        @endpoint = args[:test] ? TEST_ENDPOINT : ENDPOINT
      end

      def get_request(method, args="")
        handler connection(method).get {|req| req.params[:seller_id] = @seller_id; req.params[:item_code] = args if args.present? }
      end

      def post(method, args)
        handler connection(method).post {|req| req.body = request_body(args)}
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

      def handler(request)
        case request.status
        when 200
          request.body
        when 400
          raise InvalidParameters, request.body
        when 401
          raise InvalidTokenError, request.body
        when 403
          raise PermissionError, request.body
        when 500
          raise ApiSystemError, request.body
        when 503
          raise SystemMaintenance, request.body
        end
      end

      def connection(method)
        Faraday.new(:url => endpoint + method) do |c|
          c.adapter Faraday.default_adapter
          c.headers['Authorization'] = "Bearer " + access_token
        end
      end

      def array_hash(args)
        str = "seller_id=#{seller_id}"
        args[0].each {|key, value| str << "&#{key}=" + args.collect{|e| e[key.to_sym]}.join(',')}
        str
      end

      def hash(args)
        str = "seller_id=#{seller_id}"
        args.each {|key, value| str << "&" + key.to_s + "=" + value.to_s }
        str
      end

      def array(args)
        "seller_id=#{seller_id}&item_code=#{args.join(",")}"
      end

      def code(args)
        "seller_id=#{seller_id}&item_code=#{args}"
      end
    end
  end
end
