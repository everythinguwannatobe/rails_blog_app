require "rails_helper"

RSpec.describe "UsersSignouts", type: :system do
  before do
    @john = User.create!(email: "john@example.com", password: "password")
    visit root_path

    click_link "Log in"

    fill_in "Email Address", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log in"
  end

  scenario do
    visit root_path
    click_link "Log out"

    expect(page).to have_content("Signed out successfully.")
    expect(page).not_to have_content("Sign out")
    # expect(page).to have_content("You have signed up successfully")
  end
end
