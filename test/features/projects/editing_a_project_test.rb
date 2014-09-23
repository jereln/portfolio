require "test_helper"

feature 'owner can edit projects' do
	scenario 'editing a project' do
		visit edit_project_path(projects(:portfolio))

		fill_in 'Name', with: "This is the new name"
		click_on 'Update Project'

		page.text.must_include 'success'
		page.text.must_include 'This is the new name'
	end

	scenario 'incorrectly editing a project' do
		visit edit_project_path(projects(:portfolio))

		fill_in 'Name', with: 'Foo'
		click_on 'Update Project'

		page.text.must_include 'prohibited'
		page.text.must_include 'Name is too short'		
	end
end