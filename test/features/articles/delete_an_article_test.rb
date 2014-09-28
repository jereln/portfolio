require 'test_helper'

feature 'deleting an article' do
  scenario 'deletes an existing article' do
    sign_in(:editor)
    visit articles_path
    first(:link, 'Destroy').click

    page.wont_have_content 'Hello World'
  end
end
