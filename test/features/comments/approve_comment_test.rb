require 'test_helper'

feature 'as an author or editor I want to approve comments on my articles' do
  scenario 'approving a pending comment' do
    visit articles_path(articles(:first))
    page.must_have_content 'Comment pending approval'

    click_on 'Approve Comment'
    page.must_have_content 'Visitor'
    page.must_have_content 'visitor@example.com'
    page.must_have_content 'www.visitor.com'
    page.must_have_content 'You are wrong and I am right'
    page.wont_have_content 'Comment pending approval'
  end
end
