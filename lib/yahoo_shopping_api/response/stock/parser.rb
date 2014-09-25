module YahooShoppingApi
  module Response
    module Stock
      class Parser < Array
        def initialize(xml)
          raise ArgumentError, "Argument is must be a XML Document." unless xml.class == String
          json = XmlSimple.xml_in(xml)

          json.each do |key, value|
            next if key == "Result"
            self.define_singleton_method(key.underscore) {value[0]}
          end

          if json["Result"].size == 1
            json["Result"][0].each {|key, value| define_singleton_method(key.underscore) {value[0]}}
          else
            json["Result"].each {|item| self << Result.new(item)}
          end
        end
      end
    end
  end
end
