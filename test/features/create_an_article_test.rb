require 'test_helper'

feature 'creating an article' do
  scenario 'creates an article with content' do
    visit new_article_path
    fill_in 'Title', with: articles(:article).title
    fill_in 'Body', with: articles(:article).body
    click_on 'Create'

    page.text.must_include 'Lorem ipsum dolor'
  end
end
