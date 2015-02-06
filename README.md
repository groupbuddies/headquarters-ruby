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

You must first instantiate a client:

```ruby
client = Headquarters.new
```

You most likely want to authenticate to use protected endpoints (such as sending emails). You can do so by passing the credentials to the constructor:


```ruby
client = Headquarters.new(client_id: 'your_client_id', client_secret: 'your_client_secret')
```

The main client contains namespaces that give you access to different features of Headquarters. For example, the email API can be accessed via `client.email`. If your applications needs only to send emails, and doesn't use any other features, you can instantiate an email client directly instead:

```ruby
email_client = Headquarters::Client::Email.new(client_id: 'your_client_id', client_secret: 'your_client_secret')
```

### Members

To retrieve a collection of all members of the team you might use the `all`
operation:

```ruby
client.members.all
```

Or you can search for a specific email

```ruby
client.members.search('mpalhas@groupbuddies.com')
```

### Github

Within the `github` namespace, you can use the `pull_requests` method to get a list of all open Pull Requests in the Group Buddies organization:

```ruby
client.github.pull_requests
```

You can filter these results using anything that github takes in the `q`
parameters of its [search API](https://developer.github.com/v3/search/). For
instance, if you want to get only the open pull requests, you might do:

```ruby
client.github.pull_requests(query: 'is:open')
```

### Emails

You can send emails for Group Buddies addresses (Any non-GB addresses will be filtered out).

`app_name` can be set to be appended to the sender. i.e. `from: hq@groupbuddies.com, app_name: test` will become `hq+test@groupbuddies.com`. This is useful for filtering and labeling.

```ruby
client.email.deliver(to: 'mpalhas@groupbuddies.com,zamith@groupbuddies.com', subject: 'custom subject', body: '<b>HTML body</b>', app_name: 'hq')
```

  When using rails you can use headquarters as the delivery method, and transparently send emails using ActiveMailer as usual:

```ruby
# config/initializers/mailer.rb
ActionMailer::Base.delivery_method = :headquarters

Headquarters::RailsDeliveryMethod.credentials = {
  client_id: 'your_client_id',
  client_secret: 'your_client_secret'
}
```

Using this method, `app_name` is also available as a header or parameter to the `mail` function

```ruby
class CustomMailer < ActionMailer::Base
  # option 1, default header
  default 'app_name' => 'MyApp'

  def email
    # option 2, as an argument
    mail to: 'example@email.com', subjet: 'Subject', app_name: 'MyApp'
  end
end
```

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
