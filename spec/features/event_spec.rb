require 'rails_helper'

describe 'Creating a new event' do

  let!(:admin) { FactoryGirl.create(:admin) }
  before do
    visit '/login'
    fill_in 'user_username', with: admin.username
    fill_in 'user_password', with: admin.password
    click_button 'Login'
    visit '/events/new'
  end

  it 'shows a form' do
    expect(page).to have_css('form')
  end

  it 'saves a new event' do
    page.find_by_id('event_dex_number').select('Pikachu')
    fill_in 'event_coords', with: '37.7577627,-122.4726194'
    fill_in 'event_level_min', with: 10
    fill_in 'event_level_max', with: 20
    fill_in 'event_description', with: 'Pika Pika'
    click_button 'Create Event'

    expect(page.current_path).to match(/events\/\d+?$/)

    expect(page).to have_content('Pikachu')
    expect(page).to have_content('37.7577627,-122.4726194')

  end

end
