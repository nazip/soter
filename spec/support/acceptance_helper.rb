module AcceptanceHelper
  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Войти'
  end

  def sign_up(user)
    visit new_user_session_path
    click_on 'Зарегистрироваться'
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password
    click_on 'Зарегистрироваться'
  end
end
