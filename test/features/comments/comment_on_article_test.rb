require 'test_helper'

feature 'visitor commenting on an article' do
  scenario 'writing a comment' do
    visit article_path(articles(:first))
    save_and_open_page
    fill_in 'Your Name', with: 'Visitor'
    fill_in 'Your Email', with: 'visitor@example.com'
    fill_in 'Your URL', with: 'www.visitor.com'
    fill_in 'Your Comment', with: 'You are wrong and I am right'
    click_on 'Submit comment for approval'

    page.must_have_content 'Comment pending approval'
    page.wont_have_content 'You are wrong and I am right'
    page.wont_have_content 'Approve Comment'
  end
end