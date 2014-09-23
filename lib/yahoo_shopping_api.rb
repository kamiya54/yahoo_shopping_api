require 'xmlsimple'
require 'active_support'
require 'active_support/core_ext'
require "yahoo_shopping_api/version"
require "yahoo_shopping_api/client"
require 'yahoo_shopping_api/response'

YSA = YahooShoppingApi

module YahooShoppingApi
  class AuthError < StandardError
  end
end
