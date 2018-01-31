require 'rails_helper'

feature 'Songs' do
  background do
    user = User.create(email: 'nobody@nowhere.com', password: 'password', username: 'Arthur')
    login_as(user)
  end

  scenario 'Adding a Song' do
    visit '/'

    click_on 'Songs'
    click_on 'New Song'

    fill_in 'Name', with: 'Awesome Song'

    click_button 'Create Song'

    expect(page).to have_content('Awesome Song by Arthur')

    click_on 'Add Recording'

    expect(page).to have_content('New Recording for Awesome Song')

    fill_in 'Title', with: 'Version 1'
    attach_file('recording_audio', 'spec/fixtures/files/test.mp3', visible: false)

    click_button 'Create Recording'

    expect(page).to have_content('Awesome Song: Version 1')
  end
end
