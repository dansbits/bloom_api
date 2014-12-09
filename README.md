# BloomApi

This gem provides a client for accessing healthcare provider information
via Bloom Api. For detailed information on Bloom Api visit the
web site (http://www.bloomapi.com/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bloom_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bloom_api

## Usage

### Look up a provider
    provider = BloomApi.find_by_npi('1841223922')
    provider.npi                      # => '1841223922'
    provider.first_name               # => 'PETER'
    provider.business_address.state   # => 'OH'
    
For a list of all data available visit the Bloom Api site above and / or
check out the ruby docs here: http://www.rubydoc.info/github/carp47/bloom_api/master

## Contributing

1. Fork it ( https://github.com/[my-github-username]/bloom_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
