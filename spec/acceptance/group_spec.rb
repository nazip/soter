require_relative 'acceptance_helper'

feature 'groups', %q(
  view and edit the list of groups
) do
  given!(:group) { create(:group) }
  given!(:admin) { create(:user, admin: true) }
  given!(:user) { create(:user) }

  scenario 'not authenticated user can not view, add, delete the list of products' do
    visit groups_path
    expect(page).to_not have_content group.name
    expect(page).to_not have_content 'редак.'
    expect(page).to_not have_content 'удалить'
    expect(page).to_not have_content 'Добавить группу'
  end

  describe 'Admin' do
    before do
      sign_in(admin)
      visit groups_path
    end

    scenario 'can view the list of groups' do
      expect(page).to have_content group.name
    end

    scenario 'can edit the group' do
      expect(page).to have_content 'редак.'
      click_on 'редак.'
      expect(page).to have_button 'Сохранить'
      fill_in 'group[name]', with: 'other group name'
      click_on 'Сохранить'
      expect(page).to have_content 'other group name'
    end

    scenario 'can delete the group' do
      expect(page).to have_content 'удалить'
      click_on 'удалить'
      expect(page).to have_content 'Group удален(а).'
    end

    scenario 'can add the group' do
      expect(page).to have_content 'Добавить группу'
      click_on 'Добавить группу'
      expect(page).to have_button 'Сохранить'
      fill_in 'group[name]', with: 'other group name'
      click_on 'Сохранить'
      expect(page).to have_content 'Group создан(а).'
    end
  end

  describe 'not Admin' do
    before do
      sign_in(user)
      visit groups_path
    end

    scenario 'can Not view the list of groups' do
      expect(page).to_not have_content group.name
    end

    scenario 'can Not edit, delete, add the group' do
      expect(page).to_not have_content 'редак.'
      expect(page).to_not have_content 'удалить'
      expect(page).to_not have_content 'Добавить группу'
    end
  end
end
