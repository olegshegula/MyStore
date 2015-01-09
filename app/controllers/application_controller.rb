class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  helper_method :current_order

  helper_method :clean_cart

  def current_order

      Order.where(user: current_user).first_or_initialize

  end

  def clean_cart
     OrderItem.where(:order_id => current_order.id).destroy_all
     
  end


  def render_403
    render file: "public/403.html", status:403
  end

  def render_404
    render file: "public/404.html", status:404
  end

  def render_successful_order
    render file: "public/success_order.html"
  end

  def check_if_admin
    #render text: "Access denied",status: 403 unless params[:admin]
    render_403 unless params[:admin]
  end
  protect_from_forgery with: :exception
end
