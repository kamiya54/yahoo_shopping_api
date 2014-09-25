module YahooShoppingApi
  module Response
    module Stock
      class Parser
        def initialize(xml)
          raise ArgumentError, "Argument is must be a XML Document." unless xml.class == String
          parsed_xml = XmlSimple.xml_in(xml)
          parsed_xml["Result"].each do |item|
            item.each do |key, value|
              self.define_singleton_method(key.underscore) {value[0]}
            end
          end
          return self
        end
      end
    end
  end
end
