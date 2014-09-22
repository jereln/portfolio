require "test_helper"

feature "CanAccessHome" do
  scenario "root directs to home page" do
    visit root_path
    page.text.must_include "JEREL"
  end
end
