# Korben

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'korben'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install korben

## Usage

Add configuration to initializers files kc_config.rb

    KcConfig.setup do |config| 
      config.const_name = "MyConf"
    end
    MyConf.load!( { foo: 'bar' } )

Anywhere in your code have access to

    MyConf.foo => 'bar'
        
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
