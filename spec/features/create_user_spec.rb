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
    expect(page.current_path).to match(/products\/\d+?$/)

    expect(page).to have_content 'Test Tom'
    expect(page).to have_content ''
    expect(page).to have_content 'asdf1234'
    expect(page).to have_content '2.40'
    expect(page).to have_content '27.00'
  end

  context 'when the form is incomplete' do
    it 'displays an error message' do
      click_button 'Save Product'
      expect(page.find('.alert-danger')).to have_content "Name can't be blank, Description can't be blank,"
      expect(page.find('.alert-danger')).to have_content "Category can't be blank, Sku can't be blank,"
      expect(page.find('.alert-danger')).to have_content " Wholesale can't be blank, Retail can't be blank"
    end
  end
end
