# Edamam-ruby

This is a ruby wrapper for the [Edamam api](https://developer.edamam.com/edamam-docs-nutrition-api).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'edamam-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install edamam-ruby

## Usage
To use this library you have to initialize the Edamam::Client with a valid app_id and app_key. If you dont have one, you can register with Edamam and get your credentials.
```
client = Edamam::Client.new(app_id: "secret-app-id", app_key: "super-secret-app_id")
```
Or you can instantiate with a block
```
    client = Edamam::Client.new do |client|
        client.app_id = "secret-app-id"
        client.app_key = "super-secret-app_id"
    end
```

After instantiating, you can make a request to the Edamam foodrequest api
```
    nutritional_data = client.food_database.nutritional_data("1 large apple")
```
This would return an object which has all the successfull fields from [Edamam api](https://developer.edamam.com/edamam-docs-nutrition-api).

###Note
This gem makes use of a logger in case there is an error. You can customize this logger to use any logger of your choice.
For example, in a rails application you can simple add this as an initializer
```
    Edamam.logger = Rails.logger
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gobble/edamam-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
