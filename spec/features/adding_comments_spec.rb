require 'rails_helper'

RSpec.feature "Adding Reviews to Articles" do
  before do
    @john = User.create!(email: "john@example.com", password: "passowrd")
    @fred = User.create!(email: "fred@example.com", password: "passowrd")
    @article = Article.create(title: "This is first Article", body: "Body of first article", user: @john)
  end

  scenario "permits a signed in user to write a comments" do
    login_as(@fred)

    visit "/"
    click_link @article.title
    fill_in "New Comment", with: "An awesome article"
    click_button "Add Comment"

    expect(page).to have_content("Comment has been created")
    expect(page).to have_content("An awesome article")
    expect(current_path).to eq(article_path(@article.comments.last.id))
  end
end
