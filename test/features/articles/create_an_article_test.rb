require 'test_helper'

feature 'As a user, I want articles connected to my account so that I can be attributed as author.' do
	scenario 'creating a post' do
		visit new_user_session_path
		fill_in 'Email', with: users(:Batman).email
		fill_in 'Password', with: 'password'
		click_on 'Sign in'
		visit new_article_path

		fill_in 'Title', with: articles(:first).title
		fill_in 'Body', with: articles(:first).body

		click_on "Create Article"
		page.text.must_include articles(:first).title
		page.text.must_include articles(:first).body
		page.text.must_include 'Batman'
		page.has_css? '#author'
	end
end