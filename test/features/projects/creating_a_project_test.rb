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
	
	scenario 'name input is too short' do
		visit projects_path
		click_on 'New project'
		fill_in 'Name', with: 'Z'
		click_on "Create Project"
		current_path.must_match /projects$/
		page.text.must_include "Project could not be saved"
		page.text.must_include "Name is too short"
	end
	
	scenario 'no technoligies used is input' do
		visit projects_path
		click_on 'New project'
		fill_in 'Name', with: 'My second project'
		click_on "Create Project"
		current_path.must_match /projects$/
		page.text.must_include "Project could not be saved"
		page.text.must_include "Technologies used can't be blank"
	end
end