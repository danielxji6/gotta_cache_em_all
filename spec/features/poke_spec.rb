require 'rails_helper'

describe 'catch pokemon' do

  let!(:event) { FactoryGirl.create(:event) }
  let!(:user) { FactoryGirl.create(:user) }

  before do
    visit '/login'
    fill_in 'user_username', with: user.username
    fill_in 'user_password', with: user.password
    click_button 'Login'
    visit catch_path(event.hash_data)
  end

  it 'save the pokemon to backpack' do
    click_button 'Catch'

    expect(page.current_path).to match(/users\/\d+?$/)
    expect(page.find('.alert-success')).to have_content 'Successfully caught pokemon!'
    expect(page.find('#my_backpack')).to have_content(event.name)
  end
end

describe 'show pokemons and edit team' do

  let!(:event0) { FactoryGirl.create(:event) }
  let!(:event1) { FactoryGirl.create(:event) }
  let!(:user) { FactoryGirl.create(:user) }

  before do
    visit '/login'
    fill_in 'user_username', with: user.username
    fill_in 'user_password', with: user.password
    click_button 'Login'
    visit catch_path(event0.hash_data)
    click_button 'Catch'
    visit catch_path(event1.hash_data)
    click_button 'Catch'
  end

  it 'show all the pokemons' do
    visit user_path(user)

    expect(page).to have_content(event0.name)
    expect(page).to have_content(event1.name)
  end

  it 'swap the team' do
    visit user_path(user)
    click_link 'Edit Team'

    expect(page.current_path).to match(/users\/\d+?\/edit$/)

    page.all('#my_team .poke')[0].click
    page.all('#my_backpack .poke')[0].click
    click_button 'Save Team'

    expect(page.find('#my_team')).to have_content(event0.name)

    page.all('#my_team .poke')[0].click
    page.all('#my_backpack .poke')[0].click
    click_button 'Save Team'

    expect(page.find('#my_team')).to have_content(event1.name)
    expect(page.find('#my_backpack')).to have_content(event0.name)

    click_link 'Clear Team'

    expect(page.find('#my_backpack')).to have_content(event0.name)
    expect(page.find('#my_backpack')).to have_content(event1.name)
  end
end
