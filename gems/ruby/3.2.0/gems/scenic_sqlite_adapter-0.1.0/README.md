# ScenicSqliteAdapter

Sqlite adapter for [scenic](https://github.com/thoughtbot/scenic).

## Usage

Add these lines to your application's Gemfile:

```ruby
gem 'scenic'
gem 'scenic_sqlite_adapter', git: 'git://github.com/pdebelak/scenic_sqlite_adapter.git'
```

And then execute:

    $ bundle

Then create the following file:

```ruby
# config/initializers/scenic.rb

Scenic.configure do |config|
  config.database = Scenic::Adapters::Sqlite.new
end
```

## Limitations

Sqlite does not support all the features from the scenic gem. For instance, it
does not support materialized views or the `CREATE OR REPLACE` statement. Trying
to use those features will raise a
`Scenic::Adapters::Sqlite::FeatureNotSupportedError`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pdebelak/scenic_sqlite_adapter. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
