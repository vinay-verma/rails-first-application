# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    raise Pundit::NotAuthorizedError, 'You must log in to perform this action' unless user

    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def admin_user?
    return true if @user.admin?

    raise Pundit::NotAuthorizedError, 'Only admin user can perform this action'
  end

  class Scope
    def initialize(user, scope)
      raise Pundit::NotAuthorizedError, 'You must log in to perform this action' unless user

      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end

    private

    attr_reader :user, :scope
  end
end
