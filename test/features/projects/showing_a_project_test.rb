require "test_helper"

feature 'as a visitor, I want to view a specific project' do
	scenario 'viewing a project' do
		visit project_path(projects(:portfolio))

		page.must_have_content "How meta"
		page.must_have_content "Zurb"
	end
end