class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, only: %i[edit update destroy]
  protect_from_forgery except: [:preview]

  def index
    @users = User.all
  end

  def edit;end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to edit_admin_user_path(@user), notice: 'ユーザ情報を更新しました' }
        format.json { render :edit, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'ユーザを削除しました' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(user_param_items)
    end

    def user_param_items
      %i[name email description password password_confirmation]
    end
end
