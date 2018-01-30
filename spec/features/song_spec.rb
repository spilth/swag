require 'rails_helper'

feature 'Songs' do
  background do
    User.create(email: 'nobody@nowhere.com', password: 'password', username: 'Arthur')
  end

  scenario 'Adding a Song' do
    visit '/'
    click_on 'Sign In'

    fill_in 'Email', with: 'nobody@nowhere.com'
    fill_in 'Password', with: 'password'

    click_button 'Log in'

    click_on 'Songs'

    click_on 'New Song'

    fill_in 'Name', with: 'Awesome Song'

    click_button 'Create Song'

    expect(page).to have_content('Awesome Song by Arthur')
  end
end
