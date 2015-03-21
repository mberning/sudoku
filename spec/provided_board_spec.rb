require 'rspec'
require 'game_board'

describe GameBoard do
  it 'should supply all of the possible next moves for the first empty space on the board - case #1' do
    @board = GameBoard.new  0, 0, 8, 3, 4, 2, 9, 0, 0,
                            0, 0, 9, 0, 0, 0, 7, 0, 0,
                            4, 0, 0, 0, 0, 0, 0, 0, 3,
                            0, 0, 6, 4, 7, 3, 2, 0, 0,
                            0, 3, 0, 0, 0, 0, 0, 1, 0,
                            0, 0, 2, 8, 5, 1, 6, 0, 0,
                            7, 0, 0, 0, 0, 0, 0, 0, 8,
                            0, 0, 4, 0, 0, 0, 1, 0, 0,
                            0, 0, 3, 6, 9, 7, 5, 0, 0
    @next_move_1 = GameBoard.new 1, 0, 8, 3, 4, 2, 9, 0, 0,
                                 0, 0, 9, 0, 0, 0, 7, 0, 0,
                                 4, 0, 0, 0, 0, 0, 0, 0, 3,
                                 0, 0, 6, 4, 7, 3, 2, 0, 0,
                                 0, 3, 0, 0, 0, 0, 0, 1, 0,
                                 0, 0, 2, 8, 5, 1, 6, 0, 0,
                                 7, 0, 0, 0, 0, 0, 0, 0, 8,
                                 0, 0, 4, 0, 0, 0, 1, 0, 0,
                                 0, 0, 3, 6, 9, 7, 5, 0, 0
    @next_move_2 = GameBoard.new 5, 0, 8, 3, 4, 2, 9, 0, 0,
                                 0, 0, 9, 0, 0, 0, 7, 0, 0,
                                 4, 0, 0, 0, 0, 0, 0, 0, 3,
                                 0, 0, 6, 4, 7, 3, 2, 0, 0,
                                 0, 3, 0, 0, 0, 0, 0, 1, 0,
                                 0, 0, 2, 8, 5, 1, 6, 0, 0,
                                 7, 0, 0, 0, 0, 0, 0, 0, 8,
                                 0, 0, 4, 0, 0, 0, 1, 0, 0,
                                 0, 0, 3, 6, 9, 7, 5, 0, 0
    @next_move_3 = GameBoard.new 6, 0, 8, 3, 4, 2, 9, 0, 0,
                                 0, 0, 9, 0, 0, 0, 7, 0, 0,
                                 4, 0, 0, 0, 0, 0, 0, 0, 3,
                                 0, 0, 6, 4, 7, 3, 2, 0, 0,
                                 0, 3, 0, 0, 0, 0, 0, 1, 0,
                                 0, 0, 2, 8, 5, 1, 6, 0, 0,
                                 7, 0, 0, 0, 0, 0, 0, 0, 8,
                                 0, 0, 4, 0, 0, 0, 1, 0, 0,
                                 0, 0, 3, 6, 9, 7, 5, 0, 0
    expect(@board.next_moves).to eq([@next_move_1, @next_move_2, @next_move_3])
  end


  it 'should supply all of the possible next moves for the first empty space on the board - case #2' do
    @board = GameBoard.new  1, 0, 8, 3, 4, 2, 9, 0, 0,
                            0, 0, 9, 0, 0, 0, 7, 0, 0,
                            4, 0, 0, 0, 0, 0, 0, 0, 3,
                            0, 0, 6, 4, 7, 3, 2, 0, 0,
                            0, 3, 0, 0, 0, 0, 0, 1, 0,
                            0, 0, 2, 8, 5, 1, 6, 0, 0,
                            7, 0, 0, 0, 0, 0, 0, 0, 8,
                            0, 0, 4, 0, 0, 0, 1, 0, 0,
                            0, 0, 3, 6, 9, 7, 5, 0, 0
    @next_move_1 = GameBoard.new 1, 5, 8, 3, 4, 2, 9, 0, 0,
                                 0, 0, 9, 0, 0, 0, 7, 0, 0,
                                 4, 0, 0, 0, 0, 0, 0, 0, 3,
                                 0, 0, 6, 4, 7, 3, 2, 0, 0,
                                 0, 3, 0, 0, 0, 0, 0, 1, 0,
                                 0, 0, 2, 8, 5, 1, 6, 0, 0,
                                 7, 0, 0, 0, 0, 0, 0, 0, 8,
                                 0, 0, 4, 0, 0, 0, 1, 0, 0,
                                 0, 0, 3, 6, 9, 7, 5, 0, 0
    @next_move_2 = GameBoard.new 1, 6, 8, 3, 4, 2, 9, 0, 0,
                                 0, 0, 9, 0, 0, 0, 7, 0, 0,
                                 4, 0, 0, 0, 0, 0, 0, 0, 3,
                                 0, 0, 6, 4, 7, 3, 2, 0, 0,
                                 0, 3, 0, 0, 0, 0, 0, 1, 0,
                                 0, 0, 2, 8, 5, 1, 6, 0, 0,
                                 7, 0, 0, 0, 0, 0, 0, 0, 8,
                                 0, 0, 4, 0, 0, 0, 1, 0, 0,
                                 0, 0, 3, 6, 9, 7, 5, 0, 0
    @next_move_3 = GameBoard.new 1, 7, 8, 3, 4, 2, 9, 0, 0,
                                 0, 0, 9, 0, 0, 0, 7, 0, 0,
                                 4, 0, 0, 0, 0, 0, 0, 0, 3,
                                 0, 0, 6, 4, 7, 3, 2, 0, 0,
                                 0, 3, 0, 0, 0, 0, 0, 1, 0,
                                 0, 0, 2, 8, 5, 1, 6, 0, 0,
                                 7, 0, 0, 0, 0, 0, 0, 0, 8,
                                 0, 0, 4, 0, 0, 0, 1, 0, 0,
                                 0, 0, 3, 6, 9, 7, 5, 0, 0
    expect(@board.next_moves).to eq([@next_move_1, @next_move_2, @next_move_3])
  end

  it 'should supply all of the possible next moves for the first empty space on the board - case #3' do
    @board = GameBoard.new 1, 5, 8, 3, 4, 2, 9, 0, 0,
                           0, 0, 9, 0, 0, 0, 7, 0, 0,
                           4, 0, 0, 0, 0, 0, 0, 0, 3,
                           0, 0, 6, 4, 7, 3, 2, 0, 0,
                           0, 3, 0, 0, 0, 0, 0, 1, 0,
                           0, 0, 2, 8, 5, 1, 6, 0, 0,
                           7, 0, 0, 0, 0, 0, 0, 0, 8,
                           0, 0, 4, 0, 0, 0, 1, 0, 0,
                           0, 0, 3, 6, 9, 7, 5, 0, 0
    @next_move_1 = GameBoard.new 1, 5, 8, 3, 4, 2, 9, 6, 0,
                                 0, 0, 9, 0, 0, 0, 7, 0, 0,
                                 4, 0, 0, 0, 0, 0, 0, 0, 3,
                                 0, 0, 6, 4, 7, 3, 2, 0, 0,
                                 0, 3, 0, 0, 0, 0, 0, 1, 0,
                                 0, 0, 2, 8, 5, 1, 6, 0, 0,
                                 7, 0, 0, 0, 0, 0, 0, 0, 8,
                                 0, 0, 4, 0, 0, 0, 1, 0, 0,
                                 0, 0, 3, 6, 9, 7, 5, 0, 0
    expect(@board.next_moves).to eq([@next_move_1])
  end
end


