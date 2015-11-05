class GroupPolicy < ApplicationPolicy
  [:index?, :edit?, :update?, :new?, :create?, :destroy?].each { |v| define_method v do admin?; end }
  # [:index?].each { |v| define_method v do true; end }
end