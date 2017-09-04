# WIP Should not be used. 

# LexRubykit
This gem implements a quick back-end service for deploying applications for Amazon's LEX. Base code take from AlexaRubyKit gem.

## Installation


### For Ruby Projects:

Add this line to your application's Gemfile:

```ruby
gem 'lex_rubykit'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lex_rubykit

## Usage

This Gem provides methods to create and handle request and response objects to be used in your container of choice.

Sample usage:

```ruby
require 'lex_rubykit'
response = LexRubykit::Response.new
response.add_speech('Ruby is running ready!')
response.build_response
```

Will generate a valid outputspeech response in JSON format:
FIXME: update the output json
```JSON
{
    "version": "1.0",
    "response": {
        "outputSpeech": {
            "type": "PlainText",
            "text": "Ruby is running ready!"
        },
        "shouldEndSession": true
    }
}
```

