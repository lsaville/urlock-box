require 'rails_helper'

describe 'user visits links index' do
  scenario 'they see a form to create a link' do
    user = User.create(email: 'o@bama.com', password: 'michelle')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path

    within('form') do
      expect(page).to have_content("Title")
      expect(page).to have_content("Url")
      expect(page).to have_content("Submit Link")
    end
  end
end
