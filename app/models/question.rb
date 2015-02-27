class Question < ActiveRecord::Base
  include AttachedImage
  validates :question, :answer, presence: true
end
