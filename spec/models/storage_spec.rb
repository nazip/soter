require 'rails_helper'

RSpec.describe Storage, type: :model do
  it { should belong_to :product }
end
