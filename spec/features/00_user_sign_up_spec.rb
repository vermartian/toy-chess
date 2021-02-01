require 'rails_helper'
# User Authentication Tests
# [X] As a player I want to be able to sign up

feature 'sign up' do
  let(:player) { FactoryBot.build(:player) }

  before(:each) do
    player
  end

  scenario 'specifying valid and requird information' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'User name', with: player.user_name
    fill_in 'Email', with: player.email
    fill_in 'Password', with: player.password, match: :prefer_exact
    fill_in 'Password confirmation', with: player.password
    click_on 'Sign up'

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("Sign Out")
  end
  scenario 'required information is not supplied' do
    visit root_path
    click_link 'Sign Up'
    click_on 'Sign up'

    expect(page).to have_content("Please review the problems below:")
    expect(page).to_not have_content("Sign Out")
  end
  scenario 'password confirmation does not match confirmation' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'User name', with: player.user_name
    fill_in 'Email', with: "The" + player.email
    fill_in 'Password', with: player.password, match: :prefer_exact
    fill_in 'Password confirmation', with: "player.password"
    click_on 'Sign up'

    expect(page).to have_content("doesn't match Password")
  end
end
