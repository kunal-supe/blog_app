require 'rails_helper'

RSpec.feature "Editing Articles" do

  before do
    john = User.create!(email: "john@example.com", password: "passowrd")
    login_as(john)
    @article = Article.create(title: "This is first Article", body: "Body of first article", user: john)
  end

  scenario "A user updates an articles" do
    visit "/"

    click_link @article.title
    click_link "Edit Article"

    fill_in "Title", with: "Updated article"
    fill_in "Body", with: "Updated nody of article"
    click_button "Update Article"

    expect(page).to have_content("Article has been updated")
    expect(page.current_path).to eq(article_path(@article))
  end

  scenario "A user fails to update an article" do
    visit "/"

    click_link @article.title
    click_link "Edit Article"

    fill_in "Title", with: ""
    fill_in "Body", with: "Updated nody of article"
    click_button "Update Article"

    expect(page).to have_content("Article has not been updated")
    expect(page.current_path).to eq(article_path(@article))
  end
end
