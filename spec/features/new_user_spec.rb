require 'rails_helper'
RSpec.describe 'registration page' do
  it 'displays correct fields to create new user' do
    visit '/users'
    click_link 'New User'
    expect(current_path).to eq('/users/new')
    expect(page).to have_field('first_name')
    expect(page).to have_field('last_name')
    expect(page).to have_field('email')
    expect(page).to have_field('password')
  end
end