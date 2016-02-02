class GroupPolicy < ApplicationPolicy

  # [:update?, :new?, :create?, :destroy?].each { |v| define_method v do admin?; end }

  # class Scope < Scope
  #   def resolve
  #     scope
  #   end
  # end

  def index?
    true
  end

  def destroy?
    admin?
  end

  def new?
    admin?
  end

  def update?
    admin?
  end

  def edit?
    admin?
  end

  def create?
    admin?
  end

end