class Solver
  def self.solve(board)
    return board if board.solved?
    move_stack = board.intelligent_next_moves

    begin
      move = move_stack.shift
      if (move.solved?)
        return move
      else
        move_stack = move_stack + move.intelligent_next_moves
      end
    end while move_stack.length > 0
  end
end
