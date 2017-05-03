class ApplicationController < ActionController::API
  include Response
  include Knock::Authenticable
end
