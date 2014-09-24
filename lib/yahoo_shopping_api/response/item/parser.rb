module YahooShoppingApi
  module Response
    module Item
      class Parser
        def initialize(response)
          raise ArgumentError, "Argument is must be a Faraday::Response." unless response.class == ::Faraday::Response
          raise ::YSA::AuthError, XmlSimple.xml_in(response.body)["Message"][0] if response.status == 401
          xml = XmlSimple.xml_in(response.body)
          xml["Result"].each do |item|
            item.each do |key, value|
              self.define_singleton_method(key.underscore) {value}
            end
          end
          return self
        end
      end
    end
  end
end
