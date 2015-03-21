require 'rspec'
require 'game_board'

describe GameBoard do
  before do
    @board = GameBoard.new  0, 0, 8, 3, 4, 2, 9, 0, 0,
                            0, 0, 9, 0, 0, 0, 7, 0, 0,
                            4, 0, 0, 0, 0, 0, 0, 0, 3,
                            0, 0, 6, 4, 7, 3, 2, 0, 0,
                            0, 3, 0, 0, 0, 0, 0, 1, 0,
                            0, 0, 2, 8, 5, 1, 6, 0, 0,
                            7, 0, 0, 0, 0, 0, 0, 0, 8,
                            0, 0, 4, 0, 0, 0, 1, 0, 0,
                            0, 0, 3, 6, 9, 7, 5, 0, 0

    @board2 = GameBoard.new 1, 0, 0, 0, 0, 0, 0, 0, 0,
                            0, 2, 0, 0, 0, 0, 0, 0, 0,
                            0, 0, 3, 0, 0, 0, 0, 0, 0,
                            0, 0, 0, 4, 0, 0, 0, 0, 0,
                            0, 0, 0, 0, 5, 0, 0, 0, 0,
                            0, 0, 0, 0, 0, 6, 0, 0, 0,
                            0, 0, 0, 0, 0, 0, 7, 0, 0,
                            0, 0, 0, 0, 0, 0, 0, 8, 0,
                            0, 0, 0, 0, 0, 0, 0, 0, 9

  end

  it 'should be able to return the first unfilled position' do
    expect(@board.get_first_unknown_position).to eq(0)
  end

  it 'should be able to return the row of a position' do
    expect(@board.get_row_for_position(0)).to eq(0)
    expect(@board.get_row_for_position(9)).to eq(1)
    expect(@board.get_row_for_position(10)).to eq(1)
    expect(@board.get_row_for_position(80)).to eq(8)
  end

  it 'should be able to return the column of a position' do
    expect(@board.get_column_for_position(0)).to eq(0)
    expect(@board.get_column_for_position(1)).to eq(1)
    expect(@board.get_column_for_position(8)).to eq(8)
    expect(@board.get_column_for_position(9)).to eq(0)
  end

  it 'should be able to tell me what values are used in a row' do
    expect(@board.get_numbers_used_in_row(0)).to eq([8,3,4,2,9])
    expect(@board.get_numbers_used_in_row(1)).to eq([9,7])
  end

  it 'should be able to tell me what values are used in a column' do
    expect(@board.get_numbers_used_in_column(0)).to eq([4,7])
    expect(@board.get_numbers_used_in_column(1)).to eq([3])
  end

  it 'should be able to tell me what values are unused for a position' do
    expect(@board.get_unused_numbers_for_position(0)).to eq([1, 5, 6])
    expect(@board.get_unused_numbers_for_position(40)).to eq([2, 6])
    expect(@board.get_unused_numbers_for_position(80)).to eq([2, 4])
  end

  it 'should be able to tell me what quadrant a position is in' do
    expect(@board.get_quadrant_for_position(0)).to eq(0)
    expect(@board.get_quadrant_for_position(3)).to eq(1)
    expect(@board.get_quadrant_for_position(6)).to eq(2)
    expect(@board.get_quadrant_for_position(7)).to eq(2)
    expect(@board.get_quadrant_for_position(13)).to eq(1)
    expect(@board.get_quadrant_for_position(26)).to eq(2)

    expect(@board.get_quadrant_for_position(27)).to eq(3)
    expect(@board.get_quadrant_for_position(40)).to eq(4)
    expect(@board.get_quadrant_for_position(53)).to eq(5)

    expect(@board.get_quadrant_for_position(54)).to eq(6)
    expect(@board.get_quadrant_for_position(67)).to eq(7)
    expect(@board.get_quadrant_for_position(80)).to eq(8)
  end

  it 'should be able to tell me what values have been used in a quadrant' do
    expect(@board.get_numbers_used_in_quadrant(0)).to eq([8,9,4])
    expect(@board.get_numbers_used_in_quadrant(4)).to eq([4, 7, 3, 8, 5, 1])
    expect(@board.get_numbers_used_in_quadrant(8)).to eq([8, 1, 5])
  end

  it 'should be able to tell me what the most constrained position is' do
    expect(@board.get_most_constrained_position).to eq(45)
  end
end
