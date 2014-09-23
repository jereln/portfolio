require "test_helper"

feature 'as the owner, I want to delete a project' do
	scenario 'deleting a project' do
		visit project_path(projects(:portfolio))
		click_on 'Destroy'
		page.text.wont_include "How meta"
		page.text.must_include "Barnyard"
	end
end
