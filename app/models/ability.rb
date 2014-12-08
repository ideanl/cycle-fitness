class Ability
  include CanCan::Ability

  def initialize(user)
    return false unless user #guest

  end
end
