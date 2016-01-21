require 'rails_helper'

RSpec.describe Square, type: :model do
  let(:square) { FactoryGirl.build(:square) }

  before(:each) do
    square
  end

  it "has accessable two-dimensional numerical coordinates" do
    expect(square.coordinates).to be_an(Array)
    expect(square.coordinates.length).to eq(2)
    expect(square.coordinates[0]).to be_an(Integer)
    expect(square.coordinates[1]).to be_an(Integer)
  end

  it 'has an accessable boolean color attribute' do
    square.color = false
    
    expect(square.color).to eq(false)
  end

  it 'contains an accessable piece' do
    square.piece = Piece.new

    expect(square.piece).to be_a(Piece)
  end
end
