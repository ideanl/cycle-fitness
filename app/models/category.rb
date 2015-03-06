class Category < ActiveRecord::Base
  validates :name, presence: true

  has_many :products, through: 'product_categories'
end
