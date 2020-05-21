class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # @users = User.all.reject { |user| user.hens.empty? }
    end
  end

  # def index?
  #   return true
  # end

  def show?
    return true
  end

  def update?
    return true
  end

end
