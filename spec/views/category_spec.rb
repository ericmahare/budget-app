require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  describe 'Categories' do
    before(:each) do
      @user = User.create! password: 'password', email: 'user@email.com', name: 'Eric Mahare'
      Category.create! name: 'category1', users_id: @user.id, icon: 'Education'

      visit '/users/sign_in'
      fill_in 'Email', with: 'user@email.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    scenario 'I see add a category button' do
      expect(page).to have_content('ADD A NEW CATEGORY')
    end

    scenario 'I can see a category I added' do
      expect(page).to have_content('category1')
    end

    scenario 'A NEW CATEGORY page' do
      click_link 'ADD A NEW CATEGORY'
      expect(page).to have_content('Select label for an icon')
    end
  end
end
