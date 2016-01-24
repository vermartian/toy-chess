require 'rails_helper'
# [] As a player I want to be able to sign in
# [] As a player I want to be able to sign in


feature 'sign in and out' do
  let(:player) { FactoryGirl.create(:player) }

  before(:each) do
    player
  end

  scenario 'player signs in successfully' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: player.email
    fill_in 'Password', with: player.password
    click_on 'Log in'

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Sign Out")
  end

  scenario 'player signs out successfully' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: player.email
    fill_in 'Password', with: player.password
    click_on 'Log in'
    click_link 'Sign Out'

    expect(page).to have_content("Signed out successfully.")
    expect(page).to_not have_content("Sign Out")
  end

  scenario 'incorrect info email/password' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: "The" + player.email
    fill_in 'Password', with: "jk" + player.password
    click_on 'Log in'

    expect(page).to have_content("Invalid email or password.")
  end
end
