module YahooShoppingApi
  module Client
    class Item < Helper
      def initialize(args)
        super
      end

      def get(args)
        Response::Item::Get.new post('getItem', args)
      end
  
      def edit(args)
        Response::Item::Edit.new post('editItem', args)
      end
  
      def delete(args)
        Response::Item::Delete.new post('deleteItem', args)
      end
  
      def submit(args)
        Response::Item::Submit.new post('submitItem', args)
      end
    end
  end
end
