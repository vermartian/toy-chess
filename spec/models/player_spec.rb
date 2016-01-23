require "rails_helper"

RSpec.describe Player, type: :model do
  it { should have_valid(:user_name).when("bilboBaggins3", "Jenny") }
  it { should_not have_valid(:user_name).when("", nil) }

  it { should have_valid(:email).when("user@example.com", "have@gmail.com") }
  it { should_not have_valid(:email).when("", nil, "user", "user@com", "user.com") }

  it 'has a matching password confirmation for the password' do
    player = Player.new
    player.password = 'password'
    player.password_confirmation = 'not the same password'

    expect(player).to_not be_valid
    expect(player.errors[:password_confirmation]).to_not be_blank
  end
end
