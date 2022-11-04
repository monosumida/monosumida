class ContactsController < ApplicationController
  before_action :admin_user?

  def index
    @blog = Blog.new
  end
end
