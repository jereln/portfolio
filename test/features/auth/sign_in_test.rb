require 'test_helper'

feature 'As the site owner, I want to sign in so I can do admin stuffs' do
  scenario 'sign in' do
    sign_in

    page.must_have_content 'Signed in successfully'
    page.must_have_content 'Sign Out'
  end
end
