require 'rails_helper'

RSpec.describe Piece, type: :model do
  let(:piece) { FactoryGirl.build(:piece) }

  before(:each) do
    piece
  end

  it "exists" do

    expect(piece).to be_a(Piece)
  end

  it 'has an accessable color boolean attribute' do
    piece.color = true

    expect(piece.color).to eq(true)
  end
  it 'has an accessable type attribute' do
    piece.type = "queen"
    expect(piece.type).to eq("queen")
  end
  it 'has an accessable state' do
    piece.state = "on"

    expect(piece.state).to eq("on")
  end
  it 'has accessable x and y numerical coordinates' do
    piece.x = 1
    piece.y = 2
    expect(piece.x).to eq(1)
    expect(piece.x).to eq(1)
  end
  it 'has a sliding boolean attribute' do

    expect(piece.sliding).to eq(false)
  end
  it 'has an array of directional move vectors' do

    expect(piece.vectors).to be_an(Array)
  end
end
