# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Article, public: true
    if user.present? 
      if user.role.eql? 'admin'
        can :manage, :all
      end
      if user.role.eql? 'reader'
        can :read, Article
        can :create, Comment
        can :destroy, Comment, user_id: user.id
      end
      if user.role.eql? 'readonly'
        can :read, [Article, Comment]
      end
    end  
  end
end

