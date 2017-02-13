require 'rails_helper'

describe 'user visits links index' do
  scenario 'they see a form to create a link' do
    user_logs_in
    visit links_path

    within('form') do
      expect(page).to have_content("Title")
      expect(page).to have_content("Url")
      expect(page).to have_button("Submit Link")
    end
  end
end
