# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3, 6], # Left column
  [1, 4, 7], # Middle column
  [2, 5, 8], # Right column
  [0, 4, 8], # Left down diagonal
  [2, 4, 6], # Left up diagonal
]

def won?(board)
  return false if board.all? {|token| token == "" || token == " "}

  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if [position_1, position_2, position_3].all? { |token| token == "X"}
      winner_token = "X"
      return [win_index_1, win_index_2, win_index_3] # return the win_combination indexes that won.
      elsif [position_1, position_2, position_3].all? { |token| token == "O"}
      winner_token = "O"
      return [win_index_1, win_index_2, win_index_3]
    end
  end
  return false
end

def full?(board)
  board.all? { |token| token == "X" || token == "O"}
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  end
  if won?(board) != false
    return false
  end
  false
end

def over?(board)
  if full?(board) == false
    return false
  end
  if full?(board) || won?(board) || draw?(board)
    return true
  end
end

def winner(board)
  if won?(board).kind_of?(Array)
    board[won?(board)[0]]
  end
end
