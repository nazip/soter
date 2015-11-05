require 'rails_helper'

feature 'products', %q(
  view list of products
) do
  given!(:group) { create(:group) }
  given!(:product) { create(:product, group: group) }
  given!(:admin) { create(:user, admin: true) }
  given!(:user) { create(:user) }

  scenario 'any user can view list of products' do
    visit products_path
    expect(page).to have_content 'new product'
  end

  scenario 'authenticated user(no admin) can not delete/edit/add the product' do
    sign_in(user)
    visit products_path
    within(".product-#{product.id}") { expect(page).to_not have_content 'редак.' }
    within(".product-#{product.id}") { expect(page).to_not have_content 'удалить' }
    expect(page).to_not have_content 'Добавить продукт'
  end

  scenario 'admin can delete/edit/add the product' do
    sign_in(admin)
    visit products_path
    within(".product-#{product.id}") { expect(page).to have_content 'редак.' }
    within(".product-#{product.id}") { expect(page).to have_content 'удалить' }
    expect(page).to have_content 'Добавить продукт'
  end

end
