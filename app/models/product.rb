class Product < ActiveRecord::Base
  include AttachedImage
  validates :manufacturer, :size, :model, :description, presence: true

  has_many :categories, through: 'product_categories'

  def name
    "#{self.manufacturer} #{self.make}"
  end

  def gender
    if self[:gender].nil?
      gender = "Both"
    else
      gender = self[:gender] ? "Male" : "Female"
   end
  end
end
