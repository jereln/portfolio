require 'test_helper'

feature 'deleting an article' do
  scenario 'deletes an existing article' do
    visit articles_path
    first(:link, 'Destroy').click

    page.wont_have_content articles(:first).body
  end
end
