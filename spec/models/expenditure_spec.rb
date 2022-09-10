require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(id: 1, name: 'user1', email: 'user1@mail.com', password: 'password') }
  let(:category) { Category.create(id: 2, name: 'Education', icon: 'Education', users_id: user.id) }
  let(:expenditure) { Expenditure.create(id: 1, name: 'Books', amount: 30, user_id: user.id, category_id: category.id) }

  describe 'validations' do
    context 'should accept valid information' do
      it { expect(expenditure).to be_valid }
    end

    it 'should return an error when name is invalid ' do
      expenditure.name = nil
      expect(expenditure).to_not be_valid
    end

    it 'should return an error when amount is invalid ' do
      expenditure.amount = nil
      expect(expenditure).to_not be_valid
    end
  end
end
