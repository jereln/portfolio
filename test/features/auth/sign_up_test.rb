require 'test_helper'

feature 'as a visitor, I want to be able to sign up for an account so I can perform actions that require me to be logged in' do
  scenario ' sign up' do
    visit root_url
    click_on 'Sign Up'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'

    page.must_have_content 'Welcome! You have signed up successfully'
    page.wont_have_content 'There was a problem with your sign up'

  end
end
