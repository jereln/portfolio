require 'test_helper'

feature 'visitor commenting on an article' do
  scenario 'writing a comment' do
    visit article_path(articles(:second))
    fill_in 'Your Name', with: 'Visitor'
    fill_in 'Your Email', with: 'visitor@example.com'
    fill_in 'Your Comment', with: 'You are wrong and I am right'
    click_on 'Submit comment for approval'

    page.must_have_content 'Comment pending approval'
    page.wont_have_content 'You are wrong and I am right'
    page.wont_have_content 'Approve Comment'
  end
end
