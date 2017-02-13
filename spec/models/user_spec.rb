require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'validates presence of email' do
      user = FactoryGirl.build(:user, email: nil)

      expect(user).to_not be_valid
    end

    it 'validates presence of password' do
      user = FactoryGirl.build(:user, password: nil)

      expect(user).to_not be_valid
    end

    it 'validate uniqueness of email' do
      FactoryGirl.create(:user, email: 'bub@example.com')
      user = FactoryGirl.build(:user, email: 'bub@example.com')

      expect(user).to_not be_valid
    end
  end

  context 'relationships' do
    it 'has many links' do
      user = FactoryGirl.build(:user)

      expect(user).to respond_to(:links)
    end
  end
end
