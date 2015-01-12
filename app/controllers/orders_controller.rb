class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Order.all
  end

  def update
    @order = current_order
    @ordered_items  = OrderItem.where(:order_id => current_order.id)
    @ordered_items.map {}
    @order.update_attributes(order_params)
    if @order.errors.empty?
      clean_cart
      render_successful_order
      OrdersMailer.order_successful(@order,@ordered_items).deliver
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
