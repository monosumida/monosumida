class Admin::ApplicationController < ActionController::Base
  before_action :admin_user?

  layout 'admin/layouts/application'

  private
    def admin_user?
      if !(current_user.try(:admin?))
        raise ActionController::RoutingError, with: :render_404
      end
    end
end
