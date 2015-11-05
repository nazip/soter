class ProductPolicy < ApplicationPolicy
  [:destroy?, :new?, :update?, :edit?, :create?].each { |v| define_method v do admin?; end }
  [:index?, :sell?, :pictures?].each { |v| define_method v do true; end }
end
