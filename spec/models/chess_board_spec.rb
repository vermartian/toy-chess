require 'rails_helper'

RSpec.describe ChessBoard, type: :model do
  let(:chess_board) { FactoryGirl.build(:chess_board) }
  let(:a_number) { rand(8) }

  before(:each) do
    chess_board
    a_number
  end

  it "is made up of an 8x8 array of arrays" do
    b_number = rand(8)

    expect(chess_board.board).to be_an(Array)
    expect(chess_board.board.length).to eq(8)
    expect(chess_board.board[a_number]).to be_an(Array)
    expect(chess_board.board[a_number].length).to eq(8)
  end

  it 'using new_board method sets up the initial position of a chess match' do
    b_number = rand(2..5)
    board = chess_board.new_board
    expect(board[1][a_number]).to be_an(Pawn)
    expect(board[1][a_number].color).to eq(false)
    expect(board[6][a_number]).to be_an(Pawn)
    expect(board[6][a_number].color).to eq(true)
    expect(board[0][3]).to be_a(Queen)
    expect(board[0][a_number].color).to eq(false)
    expect(board[7][4]).to be_a(King)
    expect(board[7][a_number].color).to eq(true)
    expect(board[b_number][a_number]).to eq(nil)
  end
end
