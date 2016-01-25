require "rails_helper"

feature "new game" do
  let(:player) { FactoryGirl.create(:player) }

  before(:each) do
    player
  end

  scenario "non registered user visits home page" do
    visit root_path

    expect(page).to_not have_content("Start New Game")
  end

  scenario "user creates new game", js: true do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: player.email
    fill_in "Password", with: player.password
    click_on "Log in"
    click_link "Start New Game"
    fill_in "Name Your Game:", with: "my game"
    choose "White"
    click_on "Begin!"

    expect(page).to have_content("my game")
    # expect(page.all("table#chessboard tr").count).to eq(8)
    # expect(page.all("table#chessboard td").count).to eq(64)
  end
end
