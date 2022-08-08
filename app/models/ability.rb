# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.seller?
      cannot :manage, Cart
      cannot :manage, Order
      cannot :manage, OrderDetail
      can :manage, Product
    else
      cannot :manage,Product
      can :manage,Cart
      can :manage,Order
      can :manage,OrderDetail
  
    end
  
  end
end
