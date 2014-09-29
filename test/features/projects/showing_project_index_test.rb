require 'test_helper'

feature 'as a visitor, I want to see all the projects' do
  scenario 'viewing all projects' do
    visit projects_path

    page.must_have_content 'How meta'
    page.must_have_content 'Barnyard'
    page.must_have_content 'Rails'
  end
end
