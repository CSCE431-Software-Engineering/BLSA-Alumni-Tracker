module SystemHelper
  def login
    visit root_path
    # save_and_open_page # Snapshots the page in /tmp/capybara so you can see what the test sees!
    click_button 'Sign in with Google'
  end
end

RSpec.configure do |config|
  config.include(SystemHelper)
end