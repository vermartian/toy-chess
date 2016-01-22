require 'rails_helper'

feature 'new game' do
  scenario 'user visits new game page' do
    visit root_path
    click_on("Start New Game")

    expect(page).to have_content("Choose Your Color")
  end
end
