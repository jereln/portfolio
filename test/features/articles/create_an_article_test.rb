require 'test_helper'

feature 'creating a post' do
  scenario 'unauthenticated user cannot visit new_article_path' do
    visit new_article_path
    page.must_have_content 'You need to sign in or sign up before continuing'
  end

  scenario 'users cannot see unpublished articles' do
    visit articles_path
    page.wont_have_content 'You should not be able to see this article'
  end

  scenario 'authors cannot publish' do
    sign_in(:author)
    visit new_article_path
    page.wont_have_content 'Publish'
  end

  scenario 'editors can publish' do
    sign_in(:Batman)
    visit new_article_path
    page.must_have_content 'Published'
    fill_in 'Title', with: articles(:fourth).title
    fill_in 'Body', with: articles(:fourth).body
    check 'Published'
    click_on 'Create Article'
    page.must_have_content 'Published'
    page.must_have_content articles(:fourth).title
    page.must_have_content articles(:fourth).body
    page.must_have_content 'Batman'
    page.must_have_content 'successfully'
    page.has_css? '#author'
  end

  scenario 'author can see new article button' do
    sign_in(:Batman)
    visit articles_path
    page.must_have_content 'New Article'
  end
end
