require "rails_helper"

RSpec.describe "ShowArticles", type: :system do
  before do
    @john = User.create(email: "john@example.com", password: "password")
    @article = Article.create(
      title: "First Article", body: "Lorem ipsum dolor sit amet, consectetur.", user: @john
    )
  end

  scenario "A user shows an article" do
    visit root_path

    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(page).to have_current_path(article_path(@article), ignore_query: true)
  end
end
