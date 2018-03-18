require "http/server/handler"
require "uuid"

require "./request_id/*"

module RequestID
  class Handler
    include HTTP::Handler

    def initialize(@header = "X-Request-ID")
    end

    def generator : String
      UUID.random.to_s
    end

    def call(context)
      context.response.headers[@header] = context.request.headers[@header]? || generator

      call_next context
    end
  end
end
