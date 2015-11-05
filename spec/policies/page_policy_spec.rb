require 'rails_helper'

describe PagePolicy do
  let(:user) { create(user :user) }
  subject { described_class }

  [:index?, :contact?].each do |action|
    permissions action do
      it "any user can view page##{action}" do
        expect(subject).to permit(User.new, nil)
      end
    end
  end

end
