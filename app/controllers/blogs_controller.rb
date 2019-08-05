class BlogsController < ApplicationController
  before_action :admin?, except: [:index, :show]
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :published?, only: [:show]
  protect_from_forgery except: [:preview]

  def index
    if params[:author].present?
      _user_id = User.find_by(name: params[:author]).try(:id)
      @blogs = Blog.active.where(user_id: _user_id)
    else
      @blogs = Blog.active
    end
    if params[:category].present?
      @blogs = @blogs.belonging_to_category(params[:category])
    end
  end

  def show;end

  def new
    @blog = current_user.blogs.build
  end

  def edit;end

  def create
    @blog = current_user.blogs.build(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def preview
    @blog = Blog.new(blog_params)
    response = { blog: @blog, status: :ok }
    respond_to do |format|
      format.js { render :preview, status: :ok }
      format.json { render json: response }
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
      %i[title content]
    end

    def admin?
      if current_user.try(:admin?)
        redirect_to blogs_url, alert: '権限がありません'
      end
    end

    def published?
      if !(@blog.public_flag || current_user.try(:admin?))
        redirect_to blogs_url, alert: '権限がありません'
      end
    end
end
