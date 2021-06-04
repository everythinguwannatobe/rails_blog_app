require "rails_helper"

RSpec.describe "EditingArticles", type: :system do
  before do
    @john = User.create(email: "john@example.com", password: "password")
    @article = Article.create!(title: "First Article", body: "Body of article one", user: @john)
  end

  scenario "User updates an article" do
    visit root_path

    click_link @article.title
    click_link "Edit Article"

    fill_in "Title", with: "Updated Article"
    fill_in "Body", with: "Lorem ipsum"
    click_button "Update Article"

    expect(page).to have_content("Article has been saved")
    expect(page).to have_current_path(article_path(@article), ignore_query: true)
  end

  scenario "A user fails to update an article" do
    visit "/"

    click_link @article.title
    click_link "Edit Article"

    fill_in "Title", with: ""
    fill_in "Body", with: "Updated Body of Article"
    click_button "Update Article"

    expect(page).to have_content("Article has not been updated")
    expect(page).to have_current_path(article_path(@article), ignore_query: true)
  end
end
