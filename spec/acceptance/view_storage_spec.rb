require 'rails_helper'

feature 'view the storage', %q(
  user can view  the storage
) do
  given!(:group) { create(:group) }
  given!(:product) { create(:product, group: group) }

  scenario 'user can view storage' do
    visit products_path
save_and_open_page
    expect(page).to have_content 'new product'
  end
end
