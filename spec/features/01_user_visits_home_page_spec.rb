require 'rails_helper'

feature 'home page' do
  scenario 'user visits home page and sees the option to start a new game' do
    visit root_path

    expect(page).to have_content("Welcome!")
    expect(page).to have_content("Start New Game")
  end
end
