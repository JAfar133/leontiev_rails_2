# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # гость (не авторизированный пользователь)

    if user.role == 'organizator'
      can :manage, :all
    else
      can :read, :all
      can :join_to_meeting, Meeting
    end
  end
end
