class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def update?
    return true
  end

  def destroy?
    return user_is_owner?
  end

  private

  def user_is_owner?
    record.renter == user
  end
end
