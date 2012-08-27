# CarrierwaveMatte

Adds a 'matte' processor to Carrierwave, allowing you to specify a background colour for an image.

## Installation

Add this line to your application's Gemfile:

    gem "carrierwave-matte"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install carrierwave-matte

## Usage

Really simple, use any colour hex code you wish.

    class YourUploader < CarrierWave::Uploader::Base
      process matte: "#68a14f"
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
