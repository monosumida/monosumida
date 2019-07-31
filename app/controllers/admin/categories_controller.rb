class Admin::CategoriesController < Admin::ApplicationController
  before_action :set_category, only: %i[edit update destroy]
  protect_from_forgery except: [:preview]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit;end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_categories_path, notice: 'カテゴリを作成しました' }
        format.json { render :index, status: :ok, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to edit_admin_category_path(@category), notice: 'カテゴリを更新しました' }
        format.json { render :edit, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to admin_categories_path, notice: 'カテゴリを削除しました' }
      format.json { head :no_content }
    end
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(category_param_items)
    end

    def category_param_items
      %i[id name]
    end
end
