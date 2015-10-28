require 'rails_helper'

describe PagePolicy do
  let(:user) { create(user :user) }
  subject { described_class }

  permissions :index? do
    it 'any user can view page#index' do
      expect subject.to permit(User.new, Page.new)
    end
  end

end
