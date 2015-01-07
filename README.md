# Rb::Hasher

Takes an strings array, join the values in a single string and return the hash value of the generated string

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rb-hasher', :git => "https://#{ENV['GITHUB_USERNAME']}@github.com/fervic/rb-gems.git"
```

And then execute:

    $ bundle install

## Usage

```ruby
require 'rb/hasher'

Class MyClass

  # values_arr = ['name','address','zip5']
  
  def ArrayToHash(values_arr)
    RB::Hasher.generate(*values_arr)
  end

  # value1 = 'name'
  # value2 = 'address'
  # value3 = 'zip5'

  def ValuesToHash(value1, value2, value3)
    RB::Hasher.generate(value1, value2, value3)
  end
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rb-hasher/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
