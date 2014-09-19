require 'test_helper'

feature 'app is deployed to heroku' do
	scenario 'page loads via heroku url' do
		visit 'http://jerels-portfolio.herokuapps.com'
		
		page.must_have_content "Jerel"
	end
end
