GAME_WIDTH      = 48
SEPARATOR       = ("-" * GAME_WIDTH)
MARKER_PLAYER   = 'X'.freeze
MARKER_COMPUTER = 'O'.freeze
MARKER_EMPTY    = ' '.freeze
GRID_LINE_FULL  = "-----+-----+-----".freeze
GRID_LINE_EMPTY = "     |     |".freeze
WINNING_LINES   = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]]              # diagonals
PLAYER_USER     = "Player".freeze
PLAYER_COMP     = "Computer".freeze
PLAYER_NONE     = "None".freeze
PLAYER_FIRST    = PLAYER_COMP
WINNER_USER     = "#{PLAYER_USER} wins!".freeze
WINNER_COMP     = "#{PLAYER_COMP} wins!".freeze
WINNER_NONE     = "It's a tie!".freeze

def prompt(msg)
  puts "=> " + msg
end

def display_board(brd, user_score, comp_score)
  system 'clear'

  puts SEPARATOR
  puts "Player (#{MARKER_PLAYER}): #{user_score}" \
       "Computer (#{MARKER_COMPUTER}): #{comp_score}"
  puts SEPARATOR
  puts GRID_LINE_EMPTY
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts GRID_LINE_EMPTY
  puts GRID_LINE_FULL
  puts GRID_LINE_EMPTY
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts GRID_LINE_EMPTY
  puts GRID_LINE_FULL
  puts GRID_LINE_EMPTY
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts GRID_LINE_EMPTY
  puts
end

def initialze_board
  new_board = {}
  (1..9).each { |n| new_board[n] = MARKER_EMPTY }
  new_board
end

def empty_squares(board)
  board.keys.select { |k| board[k] == MARKER_EMPTY}
end

def joinor(arr, delim=',', word_before_last='or')
  arr[-1] = "#{word_before_last} #{arr.last}" if arr.size > 1
  arr.size == 2 ? arr.join(' ') : arr.join("#{delim} ")
end

def player_places_piece!(board)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(board))})"
    square = gets.chomp.to_i
    break if empty_squares(board).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  board[square] = MARKER_PLAYER
end

def computer_places_piece!(board)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, board, MARKER_COMPUTER)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, board, MARKER_PLAYER)
      break if square
    end
  end

  if !square
    if board[5] == MARKER_EMPTY
      square = 5
    end
  end

  if !square
    square = empty_squares(board).sample
  end

  board[square] = MARKER_COMPUTER
end

def board_full?(board)
  empty_squares(board).empty?
end

def someone_won?(board)
  !!detect_winner(board)
end

def detect_winner(board)
  WINNING_LINES.each do |line|
    if board.values_at(*line).count(MARKER_PLAYER) == 3
      return WINNER_USER
    elsif board.values_at(*line).count(MARKER_COMPUTER) == 3
      return WINNER_COMP
    end
  end
  nil
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select{ |k,v| line.include?(k) && v == MARKER_EMPTY }.keys.first
  else
    nil
  end
end

def choose_player
  prompt "Who goes first? (P)layer or (C)omputer?"
  loop do
    first_player = gets.chomp
    break if first_player == "P" || first_player == "C"
    prompt "Please enter (P) or (C)..."
  end
  convert_first_player(first_player)
end

def convert_first_player(first_player)
  first_player == 'P' ? PLAYER_USER : PLAYER_COMP
end


user_score = 0
comp_score = 0
first_player = PLAYER_FIRST
first_player = choose_player if first_player == PLAYER_NONE
loop do
  board = initialze_board

  loop do
    display_board(board, user_score, comp_score)

    case first_player
    when PLAYER_USER
      player_places_piece!(board)
      display_board(board, user_score, comp_score)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      display_board(board, user_score, comp_score)
      break if someone_won?(board) || board_full?(board)
    when PLAYER_COMP
      computer_places_piece!(board)
      display_board(board, user_score, comp_score)
      break if someone_won?(board) || board_full?(board)

      player_places_piece!(board)
      display_board(board, user_score, comp_score)
      break if someone_won?(board) || board_full?(board)
    end
  end

  display_board(board, user_score, comp_score)

  if someone_won?(board)
    case detect_winner(board)
    when WINNER_USER
      user_score += 1
      display_board(board, user_score, comp_score)
      prompt WINNER_USER
    when WINNER_COMP
      comp_score += 1
      display_board(board, user_score, comp_score)
      prompt WINNER_COMP
    end
  else
    prompt WINNER_NONE
  end

  prompt "Play again? (Y/N)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing! Goodbye!"
