require 'test_helper'

feature 'a user visits the blog' do
  scenario 'displays articles when present' do
    visit articles_path
    page.must_have_content 'Hello World'
    page.wont_have_content 'unpublished article'
  end

  scenario 'unauthenticated user can only see relevant buttons' do
    visit articles_path
    page.wont_have_content 'New Article'
    page.wont_have_content 'Update'
    page.wont_have_content 'Destroy'
  end

  scenario 'editor can see unpublished content' do
    sign_in
    visit articles_path
    page.must_have_content 'You should not be able to see this'
  end

  scenario 'author cannot edit or delete an article they did not write' do
    sign_in(:author)
    visit articles_path
    page.text.wont_include 'Superman Show Edit Destroy'
    page.text.must_include 'Author Show Edit Destroy'
  end
end
