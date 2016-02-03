require 'rails_helper'

# RSpec.feature "Users", type: :feature do
#   pending "add some scenarios (or delete) #{__FILE__}"
# end

describe "creating a new user" do

  before { visit '/signup' }

  it 'shows a form for creating a product' do
    expect(page).to have_css('form')
  end

  it 'saves the new product' do
    fill_in 'user_full_name', with: 'Test Tom'
    fill_in 'user_username', with: 'testntest'
    fill_in 'user_email', with: 'tt@tt.ga'
    fill_in 'user_password', with: '123'
    click_button 'Sign up'

    # verify we're on a page like /user/:id
    expect(page.current_path).to match(/events/)

  end

  context 'when the form is incomplete' do
    it 'displays an error message' do
      fill_in 'user_full_name', with: 'Test Tom'
      fill_in 'user_username', with: 'testntest'
      fill_in 'user_email', with: 'tt@tt.ga'
      fill_in 'user_password', with: '123'
      click_button 'Sign up'
      expect(page.find('.alert-danger')).to have_content "Username has already been take"
      expect(page.find('.alert-danger')).to have_content "Email has already been taken"
    end
  end
end
