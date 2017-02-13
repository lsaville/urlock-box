require 'rails_helper'

describe 'user logs in' do
  context 'they visit login_path and enter appropriate credentials' do
    scenario 'they are redirected to links_path and receive a success flash' do
      user = User.create(email: 'o@bama.com', password: 'michelle')

      visit login_path

      fill_in "Email", with: user.email
      fill_in "Password", with: 'michelle'
      within 'form' do
        click_on "Login"
      end

      expect(current_path).to eq(links_path)
      expect(page).to have_content("Successfully logged in!")
      expect(page).to have_content("Logout")
      expect(page).to_not have_content("Login")
    end
  end
end
