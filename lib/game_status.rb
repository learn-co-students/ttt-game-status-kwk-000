# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #first column
  [1, 4, 7], #second column
  [2, 5, 8], #third column
  [0, 4, 8], #top bottom diagonal
  [2, 4, 6], #bottom top diagonal
]

#won? (board)
def won?(board)
    counter = 0
    while counter < 8 do
      #isolate first set of win_combinations
      win_positions = WIN_COMBINATIONS[counter]
      #convert positions to values
      win_values = [board[win_positions[0]], board[win_positions[1]], board[win_positions[2]]]
      #check values equivalency
      if (position_taken?(board, win_positions[0]) && win_values[0] == win_values[1] && win_values[0] == win_values[2]) then
        return win_positions
      else
        false
      end
      counter += 1
    end
end

def full?(board)
  return !board.include?(" ")
end

def draw?(board)
  return (full?(board) && !won?(board))
end

def over?(board)
  return (won?(board) || full?(board) || draw?(board))
end

def winner(board)
  if (!won?(board)) then return nil
  else return board[won?(board)[0]]
  end
end
