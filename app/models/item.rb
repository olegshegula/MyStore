class Item < ActiveRecord::Base

  validates :price, { numericality: { greater_than: 0, allow_nil: true } }
  validates :descriptions, presence: true
  validates :name, presence: true
  validates :category_id, presence: true

  # has_and_belongs_to_many :carts
  has_many :positions
  has_many :carts, through: :positions
  has_many :comments, as: :commentable
  has_and_belongs_to_many :orders
  belongs_to :category
end
