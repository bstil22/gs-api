module Requests
  module JsonHelpers
    def json
      JSON.parse(response.body)
    end

    def add_auth (user)
      token = Knock::AuthToken.new(payload: { sub: user.id }).token
      request.headers['HTTP_AUTHORIZATION'] = "Bearer #{token}"
    end
  end
end
