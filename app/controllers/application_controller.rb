class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  helper_method :current_order

  def current_order
    # if !session[:order_id].nil?
    #   Order.find(session[:order_id])
    # else
    #   Order.new(user: current_user)
    # end
    Order.where(user: current_user).first_or_initialize
  end

  def render_403
    render file: "public/403.html", status:403
  end

  def render_404
    render file: "public/404.html", status:404
  end

  def check_if_admin
    #render text: "Access denied",status: 403 unless params[:admin]
    render_403 unless params[:admin]
  end
  protect_from_forgery with: :exception
end
