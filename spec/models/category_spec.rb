require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(id: 1, name: 'user1', email: 'user1@mail.com', password: 'password') }
  let(:category) { Category.create(id: 2, name: 'Education', icon: 'Education', users_id: user.id) }

  describe 'Validations' do
    it 'should accept valid values' do
      expect(category).to be_valid
    end

    it 'should not accept invalid name' do
      category.name = nil
      expect(category).to_not be_valid
    end

    it 'icon should be present' do
      category.icon = nil
      expect(category).to_not be_valid
    end
  end
end
