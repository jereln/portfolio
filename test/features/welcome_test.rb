require "test_helper"

describe "welcome page", :capybara do
  it "displays the welcome message" do
    visit root_path
    page.must_have_content "Welcome"
  end
end
