class Api::ApplicationController < ActionController::Base
  layout false
  protect_from_forgery only: []
end
