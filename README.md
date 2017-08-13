# Cryptorub
WIP
Trading bot that fetches price of your favorite cryptocurrency supported by the Coinbase exchange.
Currently displays the prices of the currency you're interested in, by an intervall you choose.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cryptorub'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cryptorub

## Usage

Options:
--currency: Set which cryptocurrency you're interested in (BTC/ETH/LTC)
--intervall: Set how often you want the price to be updated
--charts: Displays the charts for the cryptocurrency you chose

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/cryptorub.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
