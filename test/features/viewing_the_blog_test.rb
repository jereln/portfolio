require 'test_helper'

feature 'a user visits the blog' do
  scenario 'displays articles when present' do
    visit articles_path
    page.text.must_include('Hello World')
  end
end
