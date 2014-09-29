require 'test_helper'

feature 'CanAccessHome' do
  scenario 'root directs to home page' do
    visit root_path
    page.must_have_content 'JEREL'
  end
end
