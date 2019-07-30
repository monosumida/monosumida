class Admin::BlogsController < Admin::ApplicationController
  before_action :set_blog, only: %i[edit update destroy]
  protect_from_forgery except: [:preview]

  def index
    @blogs = Blog.all
  end

  def edit;end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to edit_admin_blog_path(@blog), notice: 'ブログを更新しました' }
        format.json { render :edit, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to admin_blogs_path, notice: 'ブログを削除しました' }
      format.json { head :no_content }
    end
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(blog_param_items)
    end

    def blog_param_items
      %i[public_flag]
    end
end
