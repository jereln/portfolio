require "test_helper"

feature 'As the site owner, I want to sign oin so I can do awesome admin stuffs' do
	scenario 'sign in' do
		sign_in
		
		page.must_have_content 'Signed in successfully'
		page.must_have_content 'Sign Out'
	end
end
