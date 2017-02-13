require 'rails_helper'

describe 'user logs in' do
  context 'they visit login_path and enter appropriate credentials' do
    scenario 'they are redirected to links_path and receive a success flash' do
      user = FactoryGirl.create(:user, password: 'blah')
      visit login_path

      fill_in "Email", with: user.email
      fill_in "Password", with: 'blah'
      click_on "Login"

      expect(current_path).to eq(links_path)
      expect(page).to have_content("Successfully logged in!")
      expect(page).to have_button("Logout")
      expect(page).to_not have_button("Login")
    end
  end
end
