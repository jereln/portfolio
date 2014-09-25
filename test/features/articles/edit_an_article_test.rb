require 'test_helper'

feature 'editing an article' do
  scenario 'updates an existing article' do
    sign_in
    visit edit_article_path(articles(:first))
    fill_in 'Title', with: 'New Title'
    click_on 'Update Article'

    page.must_have_content 'New Title'
    page.wont_have_content 'Hello World'
  end
end
