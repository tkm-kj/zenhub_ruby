# zenhub_ruby

Ruby client of [ZenHub API](https://github.com/ZenHubIO/API)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zenhub_ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zenhub_ruby

## Usage

### Setup

```ruby
require 'zenhub_ruby'

client = ZenhubRuby::Client.new('YOUR_ACCESS_TOKEN')
```

### Get issue data

```ruby
client.issue_data(REPO_ID, ISSUE_NUMBER)
```

### Get issue events

```ruby
client.issue_events(REPO_ID, ISSUE_NUMBER)
```

### Get the ZenHub Board data for a repository

```ruby
client.board_data(REPO_ID)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

MIT
