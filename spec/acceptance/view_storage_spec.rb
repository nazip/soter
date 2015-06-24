require 'rails_helper'

feature 'view the storage', %q(
  user can view  the storage
) do
  given!(:group) { create(:group) }
  given!(:product) { create(:product, group) }
  given!(:storage) { create(:storage, product) }

  scenario 'user can view the storage'

  # scenario 'user can view storage' do

  #   visit storage_path(storage)

  #   expect(page).to have_content 'new answer'
  # end
end
