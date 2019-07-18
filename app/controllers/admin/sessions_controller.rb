class Admin::SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if login(params[:email], params[:password])
      redirect_back_or_to(root_path, notice: 'ログインしました')
    else
      flash.now[:alert] = 'ログインに失敗しました'
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'ログアウトしました')
  end
end
