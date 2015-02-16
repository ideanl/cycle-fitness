class Question < ActiveRecord::Base
  include AttachedImage

  validates :image, presence: true
  validates :question, :answer, uniqueness: true, presence: true
end
