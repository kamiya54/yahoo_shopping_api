module YahooShoppingApi
  module Client
    class Item < Helper
      def initialize(args)
        super
      end

      def get(args)
        Response::Item.new get_request('getItem', args)
      end
  
      def edit(args)
        Response::Item.new post('editItem', args)
      end
  
      def delete(args)
        Response::Item.new post('deleteItem', args)
      end
  
      def submit(args)
        Response::Item.new post('submitItem', args)
      end
    end
  end
end
