# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
  ]
  
  def won?(board)
  WIN_COMBINATIONS.each do | win_combination |
     win_index_1 = win_combination[0]
     win_index_2 = win_combination[1]
     win_index_3 = win_combination[2]
     position_1 = board[win_index_1]
     position_2 = board[win_index_2]
     position_3 = board[win_index_3]
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination
    end
  end
  false
end

def full?(board)
  board.all?{|position| position == "X" || position == "O"}
end

def draw?(board)
  if full?(board) && !won?(board)
     true
   elsif !won?(board) && !full?(board)
     false
   else
     false
   end
end
end

def over?(board)
  if full?(board) || won?(board).kind_of?(Array) || draw?(board)
    true
  else 
    false
  end
end

def winner(board)
   winning_array = won?(board)
   if winning_array.kind_of?(Array)
     board[winning_array[0]]
   else
     nil
   end
end
  