require 'rspec'
require 'solver'
require 'game_board'

describe Solver do
  it 'should be able to tell when a board is already solved' do
    @board = GameBoard.new 6, 7, 8, 3, 4, 2, 9, 5, 1,
                           3, 2, 9, 1, 8, 5, 7, 6, 4,
                           4, 5, 1, 7, 6, 9, 8, 2, 3,
                           5, 1, 6, 4, 7, 3, 2, 8, 9,
                           8, 3, 7, 9, 2, 6, 4, 1, 5,
                           9, 4, 2, 8, 5, 1, 6, 3, 7,
                           7, 6, 5, 2, 1, 4, 3, 9, 8,
                           2, 9, 4, 5, 3, 8, 1, 7, 6,
                           1, 8, 3, 6, 9, 7, 5, 4, 2
    @solved_board = GameBoard.new 6, 7, 8, 3, 4, 2, 9, 5, 1,
                                  3, 2, 9, 1, 8, 5, 7, 6, 4,
                                  4, 5, 1, 7, 6, 9, 8, 2, 3,
                                  5, 1, 6, 4, 7, 3, 2, 8, 9,
                                  8, 3, 7, 9, 2, 6, 4, 1, 5,
                                  9, 4, 2, 8, 5, 1, 6, 3, 7,
                                  7, 6, 5, 2, 1, 4, 3, 9, 8,
                                  2, 9, 4, 5, 3, 8, 1, 7, 6,
                                  1, 8, 3, 6, 9, 7, 5, 4, 2
    expect(Solver.solve(@board)).to eq(@solved_board)
  end

  it 'should be able to solve a board with one missing value in each position' do
    @board = GameBoard.new 6, 7, 8, 3, 4, 2, 9, 5, 1,
                           3, 2, 9, 1, 8, 5, 7, 6, 4,
                           4, 5, 1, 7, 6, 9, 8, 2, 3,
                           5, 1, 6, 4, 7, 3, 2, 8, 9,
                           8, 3, 7, 9, 2, 6, 4, 1, 5,
                           9, 4, 2, 8, 5, 1, 6, 3, 7,
                           7, 6, 5, 2, 1, 4, 3, 9, 8,
                           2, 9, 4, 5, 3, 8, 1, 7, 6,
                           1, 8, 3, 6, 9, 7, 5, 4, 2

    @solved_board = GameBoard.new 6, 7, 8, 3, 4, 2, 9, 5, 1,
                                  3, 2, 9, 1, 8, 5, 7, 6, 4,
                                  4, 5, 1, 7, 6, 9, 8, 2, 3,
                                  5, 1, 6, 4, 7, 3, 2, 8, 9,
                                  8, 3, 7, 9, 2, 6, 4, 1, 5,
                                  9, 4, 2, 8, 5, 1, 6, 3, 7,
                                  7, 6, 5, 2, 1, 4, 3, 9, 8,
                                  2, 9, 4, 5, 3, 8, 1, 7, 6,
                                  1, 8, 3, 6, 9, 7, 5, 4, 2

    (0..80).each do |i|
      val = @board.state[i]
      @board.state[i] = 0
      expect(Solver.solve(@board)).to eq(@solved_board)
      @board.state[i] = val
    end
  end

  it 'should be able to solve a board with more than one missing value' do
    @board = GameBoard.new 0, 7, 8, 3, 0, 2, 9, 5, 0,
                           3, 0, 9, 1, 8, 5, 7, 0, 4,
                           4, 5, 0, 7, 6, 9, 0, 2, 3,
                           5, 1, 6, 0, 7, 0, 2, 8, 9,
                           0, 3, 7, 9, 0, 6, 4, 1, 0,
                           9, 4, 2, 0, 5, 0, 6, 3, 7,
                           7, 6, 0, 2, 1, 4, 0, 9, 8,
                           2, 0, 4, 5, 3, 8, 1, 0, 6,
                           0, 8, 3, 6, 0, 7, 5, 4, 0
    @board = GameBoard.new 0, 7, 8, 3, 4, 2, 9, 5, 0,
                           3, 2, 9, 1, 8, 5, 7, 6, 4,
                           4, 5, 0, 7, 6, 9, 8, 2, 3,
                           5, 1, 6, 4, 7, 3, 2, 8, 9,
                           8, 3, 7, 9, 2, 6, 4, 1, 5,
                           9, 4, 2, 8, 5, 1, 6, 3, 7,
                           7, 6, 5, 2, 1, 4, 3, 9, 8,
                           2, 9, 4, 5, 3, 8, 1, 7, 6,
                           0, 8, 3, 6, 9, 7, 5, 4, 2
    @solved_board = GameBoard.new 6, 7, 8, 3, 4, 2, 9, 5, 1,
                                  3, 2, 9, 1, 8, 5, 7, 6, 4,
                                  4, 5, 1, 7, 6, 9, 8, 2, 3,
                                  5, 1, 6, 4, 7, 3, 2, 8, 9,
                                  8, 3, 7, 9, 2, 6, 4, 1, 5,
                                  9, 4, 2, 8, 5, 1, 6, 3, 7,
                                  7, 6, 5, 2, 1, 4, 3, 9, 8,
                                  2, 9, 4, 5, 3, 8, 1, 7, 6,
                                  1, 8, 3, 6, 9, 7, 5, 4, 2
    expect(Solver.solve(@board)).to eq(@solved_board)
  end
end
