class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    # can :read, :all
    #
    # More complex examples:
    # return unless user.present?
    # can :read, :all
    # return unless user.admin?
    # can :manage, :all
  end
end
