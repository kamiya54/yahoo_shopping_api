# YahooShoppingApi

[![Build Status](https://travis-ci.org/kamiya54/yahoo_shopping_api.svg)](https://travis-ci.org/kamiya54/yahoo_shopping_api)

[![Coverage Status](https://coveralls.io/repos/kamiya54/yahoo_shopping_api/badge.png)](https://coveralls.io/r/kamiya54/yahoo_shopping_api)

Yahoo!ショッピングのWebAPI用のRubyラッパーgemです。

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yahoo_shopping_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yahoo_shopping_api

## Usage

アクセストークンとセラーIDを渡してクライアントインスタンスを作成します。
このインスタンスが`#get`や`#set`といったAPIの各メソッドを所持しています。

```ruby
client = YahooShoppingApi::Client::Stock.new(access_token: 'access_token', seller_id: 'seller_id')
```

## 対応状況

* 在庫に関連するAPI (Stock)
    * :white_check_mark: 在庫参照API (get)
    * :white_check_mark: 在庫更新API (set)
    * :white_large_square: 在庫アップロードAPI
* 商品に関連するAPI (Item)
    * :white_check_mark: 商品登録API (edit)
    * :white_large_square: 商品一括更新API
    * :white_large_square: 商品移動API
    * :white_large_square: 商品表示順序変更API
    * :white_check_mark: 商品参照API (get)
    * :white_check_mark: 商品削除API (delete)
    * :white_check_mark: 商品個別反映API (submit)
    * :white_large_square: 商品リストAPI
    * :white_large_square: 商品アップロードAPI

## Contributing

1. Fork it ( https://github.com/[my-github-username]/yahoo_shopping_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
