require 'rails_helper'

describe PagePolicy do
  let(:some_user) { create(:user) }
  let(:admin_user) { create(:user, admin: true) }
  subject { described_class }

  [:edit?, :update?, :new?, :create?, :destroy?].each do |action|
    permissions action do
      it "admin can #{action} group" do
        expect(subject).to permit(admin_user, Group.new)
      end
    end
  end

end
