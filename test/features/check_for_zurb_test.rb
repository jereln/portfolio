require "test_helper"

feature 'zerb is in use' do 
	scenario 'zerb files were created' do
		visit root_path

		page.source.must_include("css")
	end
end
