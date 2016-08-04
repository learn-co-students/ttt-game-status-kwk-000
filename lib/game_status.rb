# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end



# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [0,4,8],
  [1,4,7],
  [2,5,8],
  [2,4,6]
]




def won?(board)
  if WIN_COMBINATIONS.find do |win_combination|
      if win_combination.all? do |index| board[index] == "X"
      end
        return win_combination
      elsif win_combination.all? {|index| board[index] == "O" }
       return win_combination
      end
    end
  else
    false
  end
end

def full?(board)
  if board.any? { |space| space == " "}
    return false
  else
    return true
  end
end

def draw?(board)
  if won?(board)
    return false
  elsif !full?(board)
    return false
  else
    return true
  end
end

def over?(board)
  if won?(board)
    return true
  elsif draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if WIN_COMBINATIONS.find do |win_combination|
      if win_combination.all? do |index| board[index] == "X"
      end
        return "X"
      elsif win_combination.all? {|index| board[index] == "O" }
       return "O"
      end
    end
  else
    nil
  end
end
