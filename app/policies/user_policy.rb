class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.all
      users_initial = User.all.geocoded
      @users = users_initial.reject { |user| user.hens.empty? }
    end
  end

  def show?
    return true
  end
end
