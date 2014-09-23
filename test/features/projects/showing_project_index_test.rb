require "test_helper"

feature 'as a visitor, I want to see all the projects' do
	scenario 'viewing all projects' do
		visit projects_path

		page.text.must_include "How meta"
		page.text.must_include "Barnyard"
		page.text.must_include "Rails"
	end
end