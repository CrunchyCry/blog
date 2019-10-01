# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present? 
      can :manage, Article
      # if user.role = 'admin'?
       # can :manage, Article
      # end
    end  
  end
end

