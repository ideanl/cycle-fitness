class Question < ActiveRecord::Base
  validates :question, :answer, uniqueness: true, presence: true
end
