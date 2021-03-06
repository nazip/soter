require_relative 'acceptance_helper'

feature 'products', %q(
  add and remove picture for the products
) do
  given!(:group) { create(:group) }
  given!(:product) { create(:product, group: group) }
  given!(:admin) { create(:user, admin: true) }
  given!(:user) { create(:user) }
  given!(:attachment) { create(:attachment, attachable: product) }

  scenario 'Any user can view an attached pictures' do
    visit pictures_product_path product.id
    expect(page).to have_xpath "//img[@src=\"/uploads/attachment/file/#{attachment.id}/rails_helper.rb\"]"
  end

  describe 'Non Authenticated user' do
    scenario 'can not remove the pictures' do
      visit edit_product_path product.id
      expect(page).to_not have_content 'Удалить'
      expect(page.current_path).to eq new_user_session_path
    end

    scenario 'can not add the pictures' do
      visit edit_product_path product.id
      expect(page).to_not have_content 'Добавить фото'
      expect(page.current_path).to eq new_user_session_path
    end
  end

  describe 'Admin' do
    before do
      sign_in(admin)
      visit edit_product_path product.id
    end

    scenario 'can add the picture', js: true do
      expect do
        visit edit_product_path product.id
        expect(page).to have_content 'Добавить фото'
        click_on 'Добавить фото'
        attach_file 'File', "#{Rails.root}/spec/rails_helper.rb"
        click_button 'Сохранить'
        expect(page).to have_content 'Product обновлен'
        expect(page.current_path).to eq products_path
      end.to change(product.attachments, :count).by(1)
    end

    scenario 'can remove the picture', js: true do
      expect do
        visit edit_product_path product.id
        expect(page).to have_content 'Удалить'
        click_on 'Удалить'
        expect(page).to_not have_content 'Удалить'
      end.to change(product.attachments, :count).by(-1)
    end
  end
end
