module LoginSupport
  def login(user)
    fill_in 'session_account', with: employee.account
    fill_in 'session_password', with: employee.password
    click_button 'ログイン'
  end
end
