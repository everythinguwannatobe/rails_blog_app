require "rails_helper"

RSpec.describe "Creating Articles", type: :feature do
  scenario "A user can create an article" do
    visit "/"

    click_link "New Article"

    fill_in "Title", with: "Creating a blog"
    fill_in "Body", with: "Lorem ipsum"

    click_button "Create Article"

    expect(page).to have_content("Article has been created")
    expect(page).to have_current_path(articles_path, ignore_query: true)
  end

  scenario "A user fails to create an article" do
    visit "/"

    click_link "New Article"

    fill_in "Title", with: ""
    fill_in "Body", with: ""

    click_button "Create Article"

    expect(page).to have_content("Article has not been created")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end
end
