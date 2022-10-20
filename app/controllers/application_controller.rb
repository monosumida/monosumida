class ApplicationController < ActionController::Base
  private
    def not_authenticated
      redirect_to new_session_path, alert: "Please login first"
    end

    def admin_user?
      if !(current_user.try(:admin?))
        raise ActionController::RoutingError, with: :render_404
      end
    end
end
