require 'rails_helper'
RSpec.describe 'creating user' do
  before do
    visit '/users/new'
  end
  it 'creates a new user and redirects to users page' do
    fill_in 'first_name', with: 'Stephen'
    fill_in 'last_name', with: 'Curry'
    fill_in 'email', with: 'curry@gmail.com'
    fill_in 'password', with: 'password'
    click_button 'Create'
    expect(current_path).to eq('/users')
    expect(page).to have_text('Stephen')
  end
  it 'displays errors without correct input' do
    click_button 'Create'
    expect(current_path).to eq ('/users/new')
    expect(page).to have_text("First name can't be blank")
    expect(page).to have_text("Last name can't be blank")
  end
end