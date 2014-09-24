require 'test_helper'

feature 'editing an article' do
  scenario 'updates an existing article' do
    visit edit_article_path(articles(:article))
    fill_in 'Title', with: 'New Title'
    click_on 'Update Article'

    page.text.must_include 'New Title'
    page.text.wont_include 'Hello World'
  end
end
