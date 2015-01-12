class OrdersMailer < ActionMailer::Base
  default from: "info@mystore.localhost",
          template_path: 'mailers/orders'

  def order_successful(order,ordered)
    @order = order
    @ordered_items = ordered
    mail to: 'oleg.shchegula@dataart.com',
         subject: "You have made an order!"
  end
end
