# Ruboty::Bangohan

晩御飯の献立を一緒に考えてくれるruboty 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruboty-bangohan'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruboty-bangohan

Copy .env.sample file and export APPLICATION_ID configuration from [楽天レシピカテゴリ一覧API](https://webservice.rakuten.co.jp/api/recipecategorylist/)

    $ cp .env.sample .env
    $ source .env

## Usage
The example which let you cooperate with slack using ![ruboty-slack](https://github.com/r7kamura/ruboty-slack).

### 該当するものがある場合、ランダムでレシピを返す

![該当するものがある場合、ランダムでレシピを返す](https://qiita-image-store.s3.amazonaws.com/0/100018/fdab47ec-e630-6670-f19c-f998ce1870e5.png "該当するものがある場合、ランダムでレシピを返す")

### 該当するものがない場合、聞き返す
![該当するものがない場合、聞き返す](https://qiita-image-store.s3.amazonaws.com/0/100018/b0b076c8-b30c-4ad0-bfe0-3bf6879c891c.png 該当するものがない場合、聞き返す)

### なんでもいい場合は、勝手に選んでくれる
![該当するものがない場合、聞き返す](https://qiita-image-store.s3.amazonaws.com/0/100018/9c915941-cacb-bc2c-7db4-5757d46ac57a.png 該当するものがない場合、聞き返す)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/miraoto/ruboty-bangohan. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.
## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

