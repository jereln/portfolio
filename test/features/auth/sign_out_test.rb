require "test_helper"

feature 'As the site owner, I want to sign out a user to prevent fraud' do
	scenario 'sign out' do
		visit new_user_session_path
		fill_in 'Email', with: users(:Batman).email
		fill_in 'Password', with: 'password'

		click_on 'Sign in'
		page.must_have_content 'Signed in successfully'
		page.must_have_content 'Sign Out'

		click_on 'Sign Out'
		page.must_have_content 'Signed out successfully'
		page.wont_have_content "Sign Out"
	end
end
