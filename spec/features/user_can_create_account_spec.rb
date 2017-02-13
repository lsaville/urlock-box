require 'rails_helper'

describe 'visitor goes to new_user_path' do
  context 'they enter all required fields' do
    scenario 'they are redirected to links_path and see successful flash' do
      visit new_user_path

      fill_in "Email", with: 'bub@example.com'
      fill_in "Password", with: 'pass'
      fill_in "Password confirmation", with: 'pass'
      click_on "Create Account"

      expect(page).to have_content("Successfully created account!")
      expect(page).to have_content("Logout")
      expect(page).to_not have_content("Login")
    end
  end
end
