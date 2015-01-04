require 'carrierwave/orm/activerecord'

class Item < ActiveRecord::Base

  PRICE_BORDER = 50000

  validates :price, { numericality: { greater_than: 0, allow_nil: true } }
  validates :descriptions, presence: true
  validates :name, presence: true
  validates :category_id, presence: true
  validates :weight, presence:true
  # validates :avatar, presence: true

  # has_and_belongs_to_many :carts
  has_many :positions
  has_many :carts, through: :positions
  has_many :comments, as: :commentable
  # has_and_belongs_to_many :orders
  belongs_to :category

  mount_uploader :avatar, AvatarUploader

  scope :expensive, -> { where('price > ?', PRICE_BORDER) }
end
