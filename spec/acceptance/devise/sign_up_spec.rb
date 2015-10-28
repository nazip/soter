require 'rails_helper'

feature 'sing_up', %q(
  to ask the question or answer
  to the question
) do
  given(:user) { create(:user) }

  scenario 'non existing user can sign up' do
    visit new_user_session_path
    click_on 'Зарегистрироваться'
    fill_in 'user[email]', with: 'newusers@email.ru'
    fill_in 'user[password]', with: 'newuserspassword'
    fill_in 'user[password_confirmation]', with: 'newuserspassword'
    click_on 'Зарегистрироваться'
    expect(page).to have_content 'Please follow the link to activate your account'
    expect(User.find_by_email('newusers@email.ru')).to_not be_nil
    raw_confirmation_token, db_confirmation_token =
      Devise.token_generator.generate(User, :confirmation_token)
    User.last.update_attribute(:confirmation_token, db_confirmation_token)
    visit user_confirmation_url(confirmation_token: raw_confirmation_token)
    expect(page).to have_content 'Your email address has been successfully confirmed'
  end

  scenario 'existing user can NOT sign up' do
    sign_up(user)
    expect(page).to have_content 'Email has already been taken'
  end
end
