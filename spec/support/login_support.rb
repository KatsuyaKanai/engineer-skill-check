module LoginSupport
  def login(user)
    visit login_path
    fill_in 'employees[account]', with: employee.account
    fill_in 'employees[password]', with: employee.password
    click_button 'ログイン'
  end
end
