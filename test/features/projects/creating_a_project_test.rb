require "test_helper"

feature 'adding a project to my portfolio' do
	scenario 'adding a new project' do
		visit projects_path
		click_on 'New project'
		fill_in 'Name', with: 'First Project'
		fill_in 'Technologies used', with: 'Rails, Ruby, HTML5, CSS3'
		click_on "Create Project"
		page.text.must_include 'Project has been created'
	end
end