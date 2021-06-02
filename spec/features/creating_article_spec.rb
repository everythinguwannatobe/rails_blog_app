require "rails_helper"

RSpec.feature "Creating Articles", type: :feature do
  scenario  "A user can create an article" do
    visit "/"
    click_link "New Article"
    fill_in "Title", with: "Creating a blog"
    fill_in "Body", with: "Lorem ipsum"
    click_button "Create Article"

    expect(page).to have_content("Article has been created")
    expect(page.current_path).to eq(articles_path)
  end
end
