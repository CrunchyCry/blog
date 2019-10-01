# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Article, public: true
    if user.present? 
      can :read, Article, user_id: user.id
      if user.role.eql? 'admin'
        can :manage, Article, public: true
      end
    end  
  end
end

