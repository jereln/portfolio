require 'test_helper'

feature 'a user visits the blog' do
  scenario 'displays articles when present' do
    visit articles_path
    page.must_have_content 'Hello World'
  end
end
