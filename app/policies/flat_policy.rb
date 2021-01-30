class FlatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def show?
    return true
  end

  def destroy?
    return user_is_owner?
  end

  def update?
    user_is_owner?
  end

  private

  def user_is_owner?
    record.owner == user
  end
end