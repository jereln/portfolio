require 'test_helper'

feature 'as an author or editor I want to approve comments on my articles' do
  scenario 'approving a pending comment' do
    sign_in(:editor)
    visit article_path(articles(:first))
    fill_in 'Your Name', with: 'Visitor'
    fill_in 'Your Email', with: 'visitor@example.com'
    fill_in 'Your Comment', with: 'You are wrong and I am right'
    click_on 'Submit comment for approval'

    click_on 'Approve'
    page.must_have_content 'Visitor'
    page.must_have_content 'You are wrong and I am right'
  end
end
