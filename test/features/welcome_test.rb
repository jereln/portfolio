require 'test_helper'

describe 'Can Access Home', :capybara do
  it 'has content' do
    visit root_path
    page.must_have_content 'Welcome#index'
  end
end
