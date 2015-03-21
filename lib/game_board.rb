class GameBoard
  attr_reader :state

  def initialize(*state_values)
    @state = state_values
  end

  def set_position(position, value)
    @state[position] = value
  end

  def solved?
    get_first_unknown_position == nil
  end

  def get_first_unknown_position
    @state.index 0
  end

  def get_row_for_position(position)
    position / 9
  end

  def get_column_for_position(position)
    position % 9
  end

  def get_quadrant_for_position(position)
    row = get_row_for_position(position)
    column = get_column_for_position(position)

    (((row / 3) * 3) + (column / 3))
  end

  def get_unused_numbers_for_position(position)
    row = get_row_for_position(position)
    column = get_column_for_position(position)
    quadrant = get_quadrant_for_position(position)

    numbers_used_in_row = get_numbers_used_in_row(row)
    numbers_used_in_column = get_numbers_used_in_column(column)
    numbers_used_in_quadrant = get_numbers_used_in_quadrant(quadrant)

    (1..9).to_a - (numbers_used_in_row + numbers_used_in_column + numbers_used_in_quadrant)
  end

  def get_numbers_used_in_row(row)
    used_numbers = []
    start = row * 9
    indices_to_check = (start..(start + 8))

    indices_to_check.each do |i|
      used_numbers << @state[i] unless @state[i] == 0
    end

    used_numbers
  end

  def get_numbers_used_in_column(col)
    used_numbers = []
    indicies_to_check = (0..8).collect { |i| (i * 9) + col }

    indicies_to_check.each do |i|
      used_numbers << @state[i] unless @state[i] == 0
    end

    used_numbers
  end

  def get_numbers_used_in_quadrant(quadrant)
    numbers_used = []
    row_start = (quadrant / 3) * 3
    col_start = (quadrant % 3) * 3

    (row_start...(row_start + 3)).each do |row|
      (col_start...(col_start + 3)).each do |col|
        index = (row * 9) + col
        numbers_used << @state[index] unless @state[index] == 0
      end
    end

    numbers_used
  end

  def get_most_constrained_position
    index = nil
    min_possible_values = 9
    (0..80).each do |i|
      next unless @state[i] == 0
      possible_values = get_unused_numbers_for_position(i).length
      if possible_values <= min_possible_values
        index = i
        min_possible_values = possible_values
      end
    end
    index
  end

  def intelligent_next_moves
    next_moves(get_most_constrained_position)
  end

  def next_moves(position = get_first_unknown_position)
    possible_values = get_unused_numbers_for_position(position)
    boards = []

    possible_values.each do |val|
      new_board = self.class.new(*@state)
      new_board.set_position(position, val)
      boards << new_board
    end

    boards
  end

  def ==(other)
    if other.is_a? GameBoard
      @state == other.state
    else
      false
    end
  end

  def to_s
    s = ''
    (0...9).each do |r|
      s << @state.values_at((r * 9)...(r * 9) + 9).join(', ') + "\n"
    end
    s + "\n"
  end
end
