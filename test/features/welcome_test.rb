require "test_helper"

describe "welcome page", :capybara do
  it "displays my name" do
    visit root_path
    page.must_have_content "JEREL"
  end
end
