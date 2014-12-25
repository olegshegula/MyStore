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


  def update
    if current_user.try(:admin?)
    @category = Category.where(id: params[:id]).first
    @category.update_attributes(ad_params)
    if @category.errors.empty?
      flash[:success] = "Category successfully updated!"
      redirect_to action: "index"
    else
      render "categories/edit"
    end
    else render_403
    end

  end

  def edit
    if current_user.try(:admin?)
    @category = Category.find(params[:id])
    else render_403
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    # render json: { success: true }
    redirect_to action: "index"

  end

  def show
    redirect_to action: "index"
  end

  def ad_params
    params.require(:category).permit(:category_name)
  end

end
