require 'rails_helper'

RSpec.describe ChessBoard, type: :model do
  let(:chess_board) { FactoryGirl.build(:chess_board) }
  let(:a_number) { rand(8) }

  before(:each) do
    chess_board
    a_number
  end

  it "is made up of an 8x8 array of arrays of squares" do
    b_number = rand(8)

    expect(chess_board.squares).to be_an(Array)
    expect(chess_board.squares.length).to eq(8)
    expect(chess_board.squares[a_number]).to be_an(Array)
    expect(chess_board.squares[a_number].length).to eq(8)
    expect(chess_board.squares[a_number][b_number]).to be_a(Square)
  end

  it 'upon initialization it sets up the initial position of a chess match' do
    b_number = rand(2..5)

    expect(chess_board.board[1][a_number].piece).to be_an(Pawn)
    expect(chess_board.board[1][a_number].piece.color).to eq(false)
    expect(chess_board.board[6][a_number].piece).to be_an(Pawn)
    expect(chess_board.board[6][a_number].piece.color).to eq(true)
    expect(chess_board.board[0][3].piece).to be_a(Queen)
    expect(chess_board.board[0][a_number].piece.color).to eq(false)
    expect(chess_board.board[7][4].piece).to be_a(King)
    expect(chess_board.board[7][a_number].piece.color).to eq(true)
    expect(chess_board.board[b_number][a_number].piece).to eq(nil)
  end
end
