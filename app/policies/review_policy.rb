class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def create?
    return true
  end

  def destroy?
    record.user_id == user.id || user.admin?
  end
end
