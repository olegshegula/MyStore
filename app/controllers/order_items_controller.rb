class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save

    session[:order_id] = @order.id
    session[:user_id] = @current_user.id

    puts session[:order_id]
    puts session[:user_id]


  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end
  private
  def order_item_params
    params.require(:order_item).permit(:quantity, :item_id)
  end
end
