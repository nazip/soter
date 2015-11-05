class PagePolicy < ApplicationPolicy
  [:index?, :contact?].each { |v| define_method v do true; end }

  def initialize(user, record)
    @user = user
    @record = nil
  end

end