# lita-directions

A handler for [Lita](http://lita.io/) that returns the distance and time between two locations via the google directions api and also returns a link to the directions via google maps.

## Installation

Add lita-directions to your Lita Gemfile:

``` ruby
gem "lita-directions"
```

## Configuration

This plugin requires a api key from The Google Directions api.

``` ruby
Lita.configure do |config|
  config.handlers.directions.api_key = "xxxxxxxxxxxx-1234567890"
end
```

## Usage

```
Lita: how far is it from New York, NY to San Francisco, CA
Lita: how far from 10001 to San Francisco, CA
Lita: LGA to SFO
```

## License

[MIT](http://opensource.org/licenses/MIT)



