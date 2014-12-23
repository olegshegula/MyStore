class Category < ActiveRecord::Base
  validates :category_name, presence: true

  has_many :items

end
