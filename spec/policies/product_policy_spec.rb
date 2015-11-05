require 'rails_helper'

describe ProductPolicy do
  let(:some_user) { create(:user) }
  let(:admin_user) { create(:user, admin: true) }
  let(:product) { create(:product) }
  subject { described_class }

  permissions :index? do
    it 'any user can view product#index' do
      expect(subject).to permit(User.new, Product.new)
    end
  end

  [:destroy?, :new?, :create?, :edit?, :update?].each do |action|
    permissions action do
      it "admin can #{action} product" do
        expect(subject).to permit(admin_user, Product.new)
      end
    end
  end

  permissions :sell? do
    it 'authenticate user can view product#sell' do
      expect(subject).to permit(some_user, Product.new)
    end
  end

end

