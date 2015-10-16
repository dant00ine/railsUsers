require 'rails_helper'
RSpec.describe 'editing user' do
  it 'should display form with values already prepopulated' do
    user = User.create(first_name: 'Dexter', last_name: 'Clark', email: 'dexter@gmail.com', password: 'password')
    visit '/users'
    click_link 'Show'
    click_link 'Edit'
    expect(current_path).to eq("/users/#{user.id}/edit")
    expect(find_field('first_name').value).to eq(user.first_name)
    expect(find_field('last_name').value).to eq(user.last_name)
    expect(find_field('email').value).to eq(user.email)
    expect(find_field('password').value).to eq(user.password)
  end
end