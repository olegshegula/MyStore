class Order < ActiveRecord::Base
  belongs_to :user

  belongs_to :order_status
  has_many :order_items
  before_create :set_order_status
  before_save :update_subtotal

  def subtotal
     order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end


  private
  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end

  # has_and_belongs_to_many :items

  # def calculate_total
  #   write_attribute :total, items.map(&:price).inject(:+)

  # end
end
