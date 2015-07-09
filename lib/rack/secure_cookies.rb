require "rack/secure_cookies/version"

module Rack
  class SecureCookies
    REGEXP = /;\s*secure\s*(;|$)/i.freeze

    def initialize(app)
      @app = app
    end

    def call(env)
      request = Rack::Request.new(env)
      status, headers, body = @app.call(env)
      flag_cookies_as_secure!(headers)

      [status, headers, body]
    end

  private

    def flag_cookies_as_secure!(headers)
      if cookies = headers['Set-Cookie']
        cookies = cookies.split("\n")

        headers['Set-Cookie'] = cookies.map do |cookie|
          if cookie !~ REGEXP
            "#{cookie}; secure"
          else
            cookie
          end
        end.join("\n")
      end
    end
  end
end
