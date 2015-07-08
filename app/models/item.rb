require 'carrierwave/orm/activerecord'

class Item < ActiveRecord::Base

  PRICE_BORDER = 50000

  validates :price, { numericality: { greater_than: 0, allow_nil: true } }
  validates :descriptions, presence: true
  validates :name, presence: true
  validates :category_id, presence: true
  validates :weight, presence:true
  #validates :recommended_item,numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10}
  has_many :comments, as: :commentable

  belongs_to :category
  has_many :order_items

  mount_uploader :avatar, AvatarUploader

  scope :expensive, -> { where('price > ?', PRICE_BORDER) }

  def self.search(query)
    where("name like ?", "%#{query}%")
  end
end
