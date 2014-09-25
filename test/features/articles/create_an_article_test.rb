require 'test_helper'

feature 'As an author, I want create articles so that the editor can publish them' do
	scenario 'creating a post' do
		sign_in
		visit new_article_path
		make_new_article

		page.must_have_content articles(:first).title
		page.must_have_content articles(:first).body
		page.must_have_content 'Editor'
		page.must_have_content 'successfully'
		page.has_css? '#author'
		page.must_have_content 'unpublished'
	end

	scenario 'unauthenticated user cannot visit new_article_path' do
		visit new_article_path
		page.must_have_content "You need to sign in or sign up before continuing"
	end

	scenario 'unauthenticated user cannot see new article button' do
		visit articles_path
		page.wont_have_link "New Article"
	end

	scenario 'authors cannot publish' do
		sign_in(:author)
		visit new_article_path
		page.wont_have_content 'publish'
	end

	scenario 'editors can publish' do
		sign_in(:editor)
		visit new_article_path
		page.must_have_content 'Published'

		make_new_article
		page.must_have_content 'Published'
	end
end