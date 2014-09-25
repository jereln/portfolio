require 'test_helper'

feature 'creating a post' do
  scenario 'authenticated user creating a post' do
    sign_in
    visit new_article_path
    fill_in 'Title', with: articles(:first).title
    fill_in 'Body', with: articles(:first).body
    click_on 'Create Article'

    page.must_have_content articles(:first).title
    page.must_have_content articles(:first).body
    page.must_have_content 'Editor'
    page.must_have_content 'successfully'
    page.has_css? '#author'
    page.must_have_content 'unpublished'
  end

  scenario 'unauthenticated user cannot visit new_article_path' do
    visit new_article_path
    page.must_have_content 'You need to sign in or sign up before continuing'
  end

  scenario 'unauthenticated user cannot see new article button' do
    visit articles_path
    page.wont_have_link 'New Article'
  end

  scenario 'authors cannot publish' do
    sign_in(:author)
    visit new_article_path
    page.wont_have_content 'Publish'
  end

  scenario 'editors can publish' do
    sign_in(:editor)
    visit new_article_path
    page.must_have_content 'Published'

    fill_in 'Title', with: articles(:first).title
    fill_in 'Body', with: articles(:first).body
    check 'Published'
    click_on 'Create Article'
    page.must_have_content 'Published'
  end
end
