require 'test_helper'

feature 'as the owner, I want to delete a project' do
  scenario 'deleting a project' do
    visit project_path(projects(:portfolio))
    click_on 'Destroy'
    page.wont_have_content 'How meta'
    page.must_have_content 'Barnyard'
  end
end
