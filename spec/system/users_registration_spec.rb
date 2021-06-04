require "rails_helper"

RSpec.describe "UserLogin", type: :system do
  before do
    @john = User.create!(email: "john@example.com", password: "password")
  end

  scenario "with valid credentials" do
    visit root_path

    click_link "Log in"

    fill_in "Email Address", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log in"

    # expect(page).to have_content("You have signed up successfully")
  end
end
