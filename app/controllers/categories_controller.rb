class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.try(:admin?)
      @categories = Category.all
    else render_403
    end
  end

  def create
    @category = Category.create(ad_params)
    if @category.errors.empty?
      redirect_to action: "index"
    else
      render "categories/new"
    end

  end

  def new
    if current_user.try(:admin?)
    @category  = Category.new
    else render_403
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    # render json: { success: true }
    redirect_to action: "index"

  end

  def ad_params
    params.require(:category).permit(:category_name)
  end

end
