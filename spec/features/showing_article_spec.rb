require 'rails_helper'

RSpec.feature "Showing Article" do

  before do
    @article = Article.create(title: "This is first Article", body: "Body of first article")
  end

  scenario "show article" do
    visit "/"

    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
  end
end
