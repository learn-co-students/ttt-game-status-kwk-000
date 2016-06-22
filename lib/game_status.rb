# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
# 3 horizontal rows,
# 3 vertical columns,
#and 2 diagonals.
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # column 1
  [1,4,7], # column 2
  [2,5,8], # column 3
  [0,4,8], # diagonal 1
  [2,4,6]  # diagonal 2
]



def won?(board)
  WIN_COMBINATIONS.detect do |win|
    board[win[0]] == board[win[1]] &&
    board[win[1]] == board[win[2]] &&
    position_taken?(board, win[0])
  end

end



def full?(board)
    board.all? do |position|
    if   position == "X" || position == "O"
      true
   else
     false
   end
 end
end





def draw?(board)
   if  !won?(board)  && full?(board)
     true  #draw
  else
    false
 end
end


def over?(board)
  full?(board) || draw?(board) && won?(board)
end


def winner(board)
   if   won?(board)

   board[won?(board)[0]]
 end
end
