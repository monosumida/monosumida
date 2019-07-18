class ApplicationController < ActionController::Base
  private
  def not_authenticated
    redirect_to new_session_path, alert: "Please login first"
  end
end
