# request\_id

[![Linux Build][travis-image]][travis-url]
[![Shards version][shards-image]][shards-url]


Middleware for generates / pick up a unique request ID for **Crystal** servers.


This module set response HTTP Header like this:

> X-Request-ID: 753a468b-4179-40c4-bb58-ff508cb39d67


## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  request_id:
    github: SuperPaintman/request-id
```


--------------------------------------------------------------------------------

## Usage
### With pure Crystal server

```crystal
require "request_id"
require "http/server"

server = HTTP::Server.new("0.0.0.0", 8080,
  [
    RequestID::Handler.new
  ]) do |context|
  context.response.content_type = "text/plain"
  context.response.print "Hello request id!"
end

server.listen
```

### With Kemal

```crystal
require "request_id"
require "kemal"

add_handler RequestID::Handler.new

get "/" do |env|
  "Hello request id!"
end

Kemal.run
```


### Custom Generator

> By default: `uuid`

```crystal
require "request_id"
require "http/server"

class CustomRequestIDHandler < RequestID::Handler
  def generator()
    "custom_request_id_generator"
  end
end

server = HTTP::Server.new("0.0.0.0", 8080,
  [
    CustomRequestIDHandler.new
  ]) do |context|
  context.response.content_type = "text/plain"
  context.response.print "Hello request id!"
end

server.listen
```


--------------------------------------------------------------------------------

## Examples
### Random ID

```sh
curl -I localhost:8080
# HTTP/1.1 200 OK
# X-Request-ID: 5e3df631-85e6-4eaf-bb1c-68375291332e
```


### Set ID via Header

```sh
curl -I -H 'X-Request-ID:4ce4089d-e01e-4c7f-b35c-2ca383c7abf5' localhost:8080
# HTTP/1.1 200 OK
# X-Request-ID: 4ce4089d-e01e-4c7f-b35c-2ca383c7abf5
```


--------------------------------------------------------------------------------

## Test

```sh
crystal spec
```


--------------------------------------------------------------------------------

## Contributing

1. Fork it (<https://github.com/SuperPaintman/request-id/fork>)
2. Create your feature branch (`git checkout -b feature/<feature_name>`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin feature/<feature_name>`)
5. Create a new Pull Request


--------------------------------------------------------------------------------

## Contributors

- [SuperPaintman](https://github.com/SuperPaintman) SuperPaintman - creator, maintainer


--------------------------------------------------------------------------------

## API
[Docs][docs-url]


--------------------------------------------------------------------------------

## Changelog
[Changelog][changelog-url]


--------------------------------------------------------------------------------

## License

[MIT][license-url]


[license-url]: LICENSE
[changelog-url]: CHANGELOG.md
[docs-url]: https://superpaintman.github.io/request-id/
[travis-image]: https://img.shields.io/travis/SuperPaintman/request-id/master.svg?label=linux
[travis-url]: https://travis-ci.org/SuperPaintman/request-id
[shards-image]: https://img.shields.io/github/tag/superpaintman/request-id.svg?label=shards
[shards-url]: https://github.com/superpaintman/request-id

