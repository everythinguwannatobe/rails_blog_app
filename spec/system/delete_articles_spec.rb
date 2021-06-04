require "rails_helper"

RSpec.describe "DeleteArticles", type: :system do
  before do
    @john = User.create(email: "john@example.com", password: "password")
    login_as(@john)
    @article = Article.create!(
      title: "First Article", body: "Body of article one", user: @john
    )
  end

  scenario "User deletes an article" do
    visit root_path

    click_link @article.title
    click_link "Delete Article"
    accept_alert "A"

    expect(page).to have_content("Article has been deleted")
    expect(page).to have_current_path(articles_path)
  end
end
