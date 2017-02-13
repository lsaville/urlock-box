require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'validates presence of email' do
      user = FactoryGirl.build(:user, email: nil)

      expect(user).to_not be_valid
    end
  end
end
