require "test_helper"

feature 'as a visitor, I want to view a specific project' do
	scenario 'viewing a project' do
		visit project_path(projects(:portfolio))

		page.text.must_include "How meta"
		page.text.must_include "Zurb"
	end
end