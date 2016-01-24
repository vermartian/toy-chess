require 'rails_helper'

feature 'home page' do
  let(:player) { FactoryGirl.create(:player) }

  scenario 'prospective user visits home page and sees the option to sign up' do
    visit root_path

    expect(page).to have_content("Welcome!")
    expect(page).to have_content("Sign Up")
  end

  scenario 'user visits home page and sees the option to start a new game' do
    player
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: player.email
    fill_in "Password", with: player.password
    click_on "Log in"

    expect(page).to have_content("Start New Game")
  end
end
