# Rack::SecureCookies

Rack middleware to set the secure flag on your rack app's cookies.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'secure_cookies'
```

And then execute:

    $ bundle

## Requirements

To work properly, this middlware must be inserted after your cookie middlware.

## Usage

In `config.ru`:

```ruby
use CookieMiddleware
use Rack::SecureCookies

run YourApp
```

For Rails applications, you typically want to flag cookies as secure only in production and staging environments.  For example, `config/environments/production.rb` might include:

```ruby
config.middleware.insert_after ActionDispatch::Cookies, Rack::SecureCookies
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jmera/secure_cookies. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
