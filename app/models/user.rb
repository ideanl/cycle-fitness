class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username, :email, uniqueness: true, presence: true
  validates :password, :password_confirmation, presence: true, length: { minimum: 7 }
  validates :email, format: { with: VALID_EMAIL_REGEX }

  def can?(action, target)
    @ability ||= Ability.new self
    @ability.can? action, target
  end
end
