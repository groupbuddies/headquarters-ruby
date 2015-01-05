# Headquarters

[![Build Status](https://semaphoreapp.com/api/v1/projects/2a53d14e-b72c-4047-bd1d-1193498cf8fe/311022/shields_badge.svg)](https://semaphoreapp.com/groupbuddies/headquarters-ruby)

Ruby wrapper for the [headquarters API](https://github.com/groupbuddies/headquarters)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'headquarters'
```

Or if you want the edge version:

```ruby
gem 'headquarters', github: 'groupbuddies/headquarters-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install headquarters


## Configuration

You can set the API's base endpoint and port:

```ruby
Headquarters.api_base = "0.0.0.0"
Headquarters.api_port = 3000
```

### Logging

Out of the box headquarters-ruby will log all requests and responses to `STDOUT`, you
can use any logger you want, though:

```ruby
Headquarters.logger = Logger.new(STDERR)
```

## Usage

Refer to the feature sets section of the [wiki](https://github.com/groupbuddies/headquarters-ruby/wiki#feature-sets)

## Testing

To run the tests (including style tests with Rubucop) install all the
dependencies and run the default rake task:

```
bundle install
bundle exec rake
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/headquarters/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
