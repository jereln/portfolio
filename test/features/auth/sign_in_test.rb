require 'test_helper'

feature 'As the site owner, I want to sign in so I can do admin stuffs' do
  scenario 'sign in' do
    sign_in

    page.must_have_content 'Signed in successfully'
    page.must_have_content 'Sign Out'
  end

  scenario 'sign in with twitter works' do
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(
                            :twitter,
                            uid: '12345',
                            info: { nickname: 'test_twitter_user' })
    visit root_path
    Capybara.current_session.driver.request.env['devise.mapping']\
    = Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth']\
    = OmniAuth.config.mock_auth[:twitter]

    click_on 'Sign in with Twitter'
    page.must_have_content 'Signed in as test_twitter_user'
  end
end
