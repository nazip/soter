require 'rails_helper'

feature 'Sign out', %q( for user
) do
  given(:user) { create(:user) }
  scenario 'existing user can sign out' do
    sign_in(user)
    root_path
    expect(page).to have_link('Выйти')
    click_on 'Выйти'
    expect(page).to have_content 'Signed out successfully.'
  end

  scenario 'non existing can NOT sign out' do
    visit root_path
    expect(page).to_not have_link('Выйти')
  end
end
