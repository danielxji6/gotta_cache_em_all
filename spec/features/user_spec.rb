require 'rails_helper'

describe 'Creating a new user' do

  let(:user) { FactoryGirl.create(:user) }
  before { visit '/signup' }

  it 'shows a form for creating a user' do
    expect(page).to have_css('form')
  end

  it 'saves the new user' do
    fill_in 'user_full_name', with: 'Test Tom'
    fill_in 'user_username', with: 'testntest'
    fill_in 'user_email', with: 'tt@tt.ga'
    fill_in 'user_password', with: '123'
    click_button 'Sign up'

    expect(page.current_path).to match(/events/)

  end

  context 'when username or email duplicate' do
    it 'displays an error message' do
      fill_in 'user_full_name', with: 'Mr. Meeseeks'
      fill_in 'user_username', with: user.username
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Sign up'
      expect(page.find('.alert-danger')).to have_content 'Username has already been take'
      expect(page.find('.alert-danger')).to have_content 'Email has already been taken'
    end
  end
end

describe 'Creating login session for user' do

  let(:user) { FactoryGirl.create(:user) }
  before { visit '/login' }

  it 'shows a form for login' do
    expect(page).to have_css('form')
  end

  it 'login the user' do
    fill_in 'user_username', with: user.username
    fill_in 'user_password', with: user.password
    click_button 'Login'

    expect(page.current_path).to match(/events/)

  end

  context 'when login with wrong information' do
    it 'displays an error message' do
      fill_in 'user_username', with: 'testntest'
      fill_in 'user_password', with: 'WrongPassword'
      click_button 'Login'
      expect(page.find('.alert-danger')).to have_content 'Invalid credentials'
    end
  end
end

describe 'Destory login session' do

  let(:user) { FactoryGirl.create(:user) }
  it 'logout user' do
    visit '/login'
    fill_in 'user_username', with: user.username
    fill_in 'user_password', with: user.password
    click_button 'Login'
    click_link 'Logout'

    expect(page.find('#login_link')).to have_content 'Login'

  end
end

describe 'Adding or removing new admin as admin' do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:admin) }

  before do
    visit '/login'
    fill_in 'user_username', with: admin.username
    fill_in 'user_password', with: admin.password
    click_button 'Login'
    visit '/users'
  end

  it 'has a text fornm' do
    expect(page).to have_css('form')
  end

  it 'can add and remove other user as admin' do
    # Add
    fill_in 'username', with: user.username
    click_button 'Save/Remove Admin'

    expect(page.find('.alert-success')).to have_content 'Successfully added admin.'
    expect(page).to have_content user.username

    # remove
    fill_in 'username', with: user.username
    click_button 'Save/Remove Admin'

    expect(page.find('.alert-success')).to have_content 'Successfully removed admin.'
  end

  it 'will not add a wrong username' do
    fill_in 'username', with: 'SuperAdmin'
    click_button 'Save/Remove Admin'

    expect(page.find('.alert-danger')).to have_content 'User not found, please try again.'
  end

end
