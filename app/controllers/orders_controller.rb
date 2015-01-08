class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Order.all
  end

  def update
    @order = current_order
    @order.update_attributes(order_params)
    if @order.errors.empty?
      render_successful_order
      clean_cart
    else
      redirect_to carts_path
    end

  end

  def edit

  end

  private
  def order_params
    params.require(:order).permit(:order_status_id)
  end

end
