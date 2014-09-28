require 'test_helper'

feature 'a user visits the blog' do
  scenario 'displays articles when present' do
    visit articles_path
    page.must_have_content 'Hello World'
  end

  scenario 'unauthenticated user can only see relevant buttons' do
    visit articles_path
    page.wont_have_content 'New Article'
    page.wont_have_content 'Update'
    page.wont_have_content 'Destroy'
  end
end
