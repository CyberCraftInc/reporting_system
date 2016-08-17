class Ability
  include CanCan::Ability

  def initialize(user)
    if user.superadmin?
        can :manage, :all
    elsif user.admin?
        can [:read, :create], Message
        can [:update,:destroy], Message, :category => "Public"
    elsif user.user?
        can :create, Message, :category => "Private"
        can :read, Message
    elsif user.guest?
        can :read, Message, :category => "Public"
        # can :read, Message do |message|
        #     message.try(:category) == 'Public'
        # end
    end
  end
end
