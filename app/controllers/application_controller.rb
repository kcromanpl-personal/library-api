class ApplicationController < ActionController::Base
  # TODO: explain
  skip_before_action :verify_authenticity_token
end
