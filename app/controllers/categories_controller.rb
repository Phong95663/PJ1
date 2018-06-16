class CategoriesController < ApplicationController
  layout "admin/application"
  before_action :load_category, except: %i( index )

  def index
    @category = Category.new
    @categories = Category.root_categories
  end

  def new
    respond_to do |format|
      format.html {redirect_to @category}
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.html {redirect_to @category}
      format.js
    end
  end

  def update
    if @category.update_attributes category_params
      respond_to do |format|
        format.html {redirect_to @category}
        format.js
      end
    end
  end

  def new_child
    respond_to do |format|
      format.html {redirect_to @category}
      format.js
    end
  end

  def create
    @category = Category.new category_params
    if @category.save!
      respond_to do |format|
        format.html {redirect_to @category}
        format.js
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html {redirect_to @category}
      format.js
    end
  end

  private

  def category_params
    params.require(:category).permit(:id, :name, :parent_id)
  end

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
  end
end
