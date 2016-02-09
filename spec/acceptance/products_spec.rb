require_relative 'acceptance_helper'

feature 'products', %q(
  view, del, add, edit the products
) do
  given!(:group) { create(:group) }
  given!(:product) { create(:product, group: group) }
  given!(:admin) { create(:user, admin: true) }
  given!(:user) { create(:user) }
  given!(:attachment) { create(:attachment, attachable: product) }

  describe 'Not authenticated user' do
    before { visit products_path }

    scenario 'can view list of products' do
      expect(page).to have_content 'new product'
    end

    scenario 'can not delete/edit/add the product' do
      within(".product-#{product.id}") { expect(page).to_not have_content 'редак.' }
      within(".product-#{product.id}") { expect(page).to_not have_content 'удалить' }
      expect(page).to_not have_content 'Добавить продукт'
    end
  end

  describe 'Authenticated user (not Admin)' do
    before do
      sign_in(user)
      visit products_path
    end

    scenario 'can view list of products' do
      expect(page).to have_content 'new product'
    end

    scenario 'can not delete/edit/add the product' do
      within(".product-#{product.id}") { expect(page).to_not have_content 'редак.' }
      within(".product-#{product.id}") { expect(page).to_not have_content 'удалить' }
      expect(page).to_not have_content 'Добавить продукт'
    end
  end

  describe 'Admin (authenticated)' do
    before do
      sign_in(admin)
      visit products_path
    end

    scenario 'can delete the product' do
      within(".product-#{product.id}") { expect(page).to have_content 'удалить' }
      click_on 'удалить'
      expect(page).to have_content "Product удален(а)."
    end

    scenario 'can edit the product' do
      within(".product-#{product.id}") { expect(page).to have_content 'редак.' }
      click_on 'редак.'
      expect(page).to have_button 'Сохранить'
      fill_in 'product[name]', with: 'changed name'
      click_on 'Сохранить'
      expect(page).to have_content 'changed name'
    end

    scenario 'can add the product' do
      expect(page).to have_content 'Добавить продукт'
      click_on 'Добавить продукт'
      expect(page).to have_button 'Сохранить'
      fill_in 'product[name]', with: 'second product'
      fill_in 'product[art]', with: 'second art'
      select 'new group', from: 'product[group_id]'
      click_on 'Сохранить'
      expect(page).to have_content 'Product создан(а).'
    end
  end
end
