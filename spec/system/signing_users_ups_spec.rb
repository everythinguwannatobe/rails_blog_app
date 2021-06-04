require "rails_helper"

RSpec.describe "SigningUsersUps", type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario "with valid credentials" do
    visit root_path

    click_link "Sign up"

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully")
  end

  scenario "with invalid credentials" do
    visit root_path

    click_link "Sign up"

    fill_in "Email", with: ""
    fill_in "Password", with: ""
    fill_in "Password confirmation", with: ""
    click_button "Sign up"

    # expect(page).to have_content("You have not signed up successfully")
  end
end
