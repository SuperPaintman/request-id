require "http/server/handler"
require "secure_random"

require "./request_id/*"

module RequestID
  class Handler
    include HTTP::Handler

    def initialize(@header = "X-Request-ID")
    end

    def generator : String
      SecureRandom.uuid
    end

    def call(context)
      context.response.headers[@header] = context.request.headers[@header]? || generator

      call_next context
    end
  end
end
