class UserPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user,record)
    # who is trying to perform the action
    @user = user

    # the info being accessed
    @record = record
  end

  # Is admin a variable in Ruby? Do we need this if our app doesn't have an admin role?
  def index?
    user.admin?
  end

  # Returns true if User is admin, or if user is the same as record (the users own data)
  def show?
    user.admin? || user == record
  end

  # Admins can create new users; returns true if user is admin, and creates a user?
  def create?
    user.admin?
  end

  #Used to check auth logic for rendering a 'create user form', and follows logic within Create
  def new?
    create?
  end

  def update?
    user.admin? || user == record
  end

  def edit?
    update?
  end

  def destroy?
    user.admin?
  end

  # GOing to leave this blank for now... Not worried too much about user roles yet
  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
