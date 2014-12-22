class ItemsMailer < ActionMailer::Base
  default from: "info@mystore.localhost",
          template_path: 'mailers/items'

  def item_destroyed(item)
    @item = item
    mail to: 'oleg.shchegula@dataart.com',
          subject: "Item destroyed!"
  end
end
