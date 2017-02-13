require 'rails_helper'

describe 'user visiting links index' do
  context 'creating a new link' do
    scenario 'fills in bad url and clicks submit link' do
      user_logs_in
      user = User.first

      visit links_path

      fill_in "Title", with: 'Cat videos'
      fill_in "Url", with: 'youtube.com/watch?v=tntOCGkgt98'
      click_on "Submit Link"

      expect(page).to have_content("Url is not a valid URL")
      expect(page).to_not have_content("Cat videos")
      expect(page).to_not have_content("https://www.youtube.com/watch?v=tntOCGkgt98")
    end
  end
end
