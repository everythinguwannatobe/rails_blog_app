require "rails_helper"

RSpec.describe "ShowArticles", type: :system do
  before do
    @article = Article.create(title: "First Article", body: "Lorem ipsum dolor sit amet, consectetur.")
  end

  scenario "A user shows an article" do
    visit root_path

    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(page).to have_current_path(article_path(@article), ignore_query: true)
  end
end
