require 'test_helper'

feature 'deleting an article' do
  scenario 'editor deletes an existing article' do
    sign_in(:editor)
    visit articles_path
    first(:link, 'Destroy').click

    page.wont_have_content 'Hello World'
  end

  scenario 'visitor cannot delete an article' do
    visit articles_path
    page.wont_have_content 'Destroy'
  end

end
