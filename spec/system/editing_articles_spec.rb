require "rails_helper"

RSpec.describe "EditingArticles", type: :system do
  before do
    @article = Article.create!(title: "First Article", body: "Body of article one")
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
end
