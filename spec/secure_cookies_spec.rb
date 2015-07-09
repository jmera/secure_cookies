require 'spec_helper'

describe Rack::SecureCookies do
  let(:app) { -> (env) { [200, {"Set-Cookie" => "cookie"}, []] } }
  let(:stack) { Rack::SecureCookies.new(app) }
  let(:request) { Rack::MockRequest.new(stack) }

  it "has a version number" do
    expect(Rack::SecureCookies::VERSION).not_to be nil
  end

  it "flags cookies as secure" do
    response = request.get('/')
    expect(response.headers['Set-Cookie'])
      .to match(Rack::SecureCookies::REGEXP)
  end
end
