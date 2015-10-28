require 'rails_helper'

describe ProductPolicy do
  let(:user) { create(:user) }
  subject { described_class }

  permissions :index? do
    it 'any user can view product#index' do
      expect(subject).to permit(User.new, Product.new)
    end
  end

  permissions :sell? do
    it 'authenticate user can view product#sell' do
      expect(subject).to permit(user, Product.new)
    end
  end


end

