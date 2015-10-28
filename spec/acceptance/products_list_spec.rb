require 'rails_helper'

feature 'products', %q(
  view list of products
) do
  given!(:group) { create(:group) }
  given!(:product) { create(:product, group: group) }

  scenario 'any user can view list of products' do
    visit products_path
    expect(page).to have_content 'new product'
  end

  scenario 'only authenticate user can bye the products'

  scenario 'non authenticate user can not bye the products'

end
