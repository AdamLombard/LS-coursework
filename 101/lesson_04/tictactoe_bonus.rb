require 'pry'

class String
  def colorize(code)
    "\e[#{code}m#{self}\e[0m"
  end

  def pink
    colorize(35)
  end

  def blue
    colorize(36)
  end
end

GAME_WIDTH      = 48
SEPARATOR       = ("-" * GAME_WIDTH)
MARKER_PLAYER   = 'X'.pink.freeze
MARKER_COMPUTER = 'O'.blue.freeze
MARKER_EMPTY    = ' '.freeze
GRID_LINE_FULL  = "-----+-----+-----".freeze
GRID_LINE_EMPTY = "     |     |".freeze
WINNING_LINES   = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> " + msg
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'

  puts SEPARATOR
  puts "Player (#{MARKER_PLAYER}): Computer (#{MARKER_COMPUTER}):"
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
# rubocop:enable Metrics/AbcSize

def initialze_board
  new_board = {}
  (1..9).each { |n| new_board[n] = n }
  new_board
end

def empty_squares(board)
  board.keys.select { |k| board[k].to_i > 0 }
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
  square        = empty_squares(board).sample
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
      return 'Player'
    elsif board.values_at(*line).count(MARKER_COMPUTER) == 3
      return 'Computer'
    end
  end
  nil
end

loop do
  board = initialze_board

  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  prompt "Play again? (Y/N)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing! Goodbye!"
