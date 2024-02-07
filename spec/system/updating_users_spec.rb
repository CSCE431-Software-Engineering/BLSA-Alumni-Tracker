require 'rails_helper'

RSpec.describe "UpdatingUsers", type: :system do
  before do
    driven_by(:rack_test)
  end

  # it 'does not save the user if the First Name is missing' do
  #   visit edit_user_path
  #   fill_in 'First name', with: ''
  #   click_on 'Update User'
  #   expect(page).to have_content("First name can't be blank")
  # end
  #not sure how to pass in an example user to test on
end
