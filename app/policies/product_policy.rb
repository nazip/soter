class ProductPolicy < ApplicationPolicy

  def index?
    true
  end

  def sell?
    true
  end

end