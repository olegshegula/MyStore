class AdminController < ApplicationController
   # before_filter :check_if_admin
  layout "admin"
  def users_count
     @users_count = User.count
  end

  def create
    # @category = Category.find(1)
    @category = Category.create(category_name: params[:category_name])
    if @category.errors.empty?
      # redirect_to item_path(@category)
      # render "items/show"
    else
      render "items/new"
    end
    # render text: params.inspect
  end

  def ad_params
    params.require(:@category).permit(:category_name)
  end

end
