require 'test_helper'

feature 'editing an article' do
  scenario 'updates an existing article' do
  	visit new_user_session_path
	fill_in 'Email', with: users(:Batman).email
	fill_in 'Password', with: 'password'
	click_on 'Sign in'
    visit edit_article_path(articles(:first))
    fill_in 'Title', with: 'New Title'
    click_on 'Update Article'

    page.text.must_include 'New Title'
    page.text.wont_include 'Hello World'
  end
end
