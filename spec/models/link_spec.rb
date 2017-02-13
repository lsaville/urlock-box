require 'rails_helper'

RSpec.describe Link, type: :model do
  context 'validations' do
    it 'accepts full url' do
      link = Link.new(url: 'http://www.blah.com', title: 'blah')

      expect(link).to be_valid
    end

    it 'rejects partial url' do
      link = Link.new(url: 'blah.com', title: 'blah')

      expect(link).to_not be_valid
    end
  end

  context 'default read value is false' do
    it 'has a read value of false upon creation' do
      link = Link.new(url: 'http://www.blah.com', title: 'blah')

      expect(link.read).to eq(false)
    end
  end

  context 'relationships' do
    it 'belongs to a user' do
      link = Link.new(url: 'http://www.blah.com', title: 'blah')

      expect(link).to respond_to(:user)
    end
  end
end
