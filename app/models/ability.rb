class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :admin
      can :manage, :all
    else
      can [:show, :edit, :update], User do |current_user|
        user.id == current_user.id
      end
      cannot :create, :all
      cannot :destroy, :all
    end
  end
end
