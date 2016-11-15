GAME_WIDTH   = 80
ZONE_WIDTH   = (GAME_WIDTH / 4)
SEPARATOR    = ("-" * GAME_WIDTH).freeze
SEPARATOR_THICK = ("=" * GAME_WIDTH).freeze
SCORE_LIMIT  = 21
DEALER_LIMIT = (SCORE_LIMIT - 4)
ROUND_WAGER  = 50
NUM_CARDS    = %w(2 3 4 5 6 7 8 9).freeze
FACE_CARDS   = %w(J Q K).freeze
ACE          = 'A'.freeze
VALUES       = (NUM_CARDS + FACE_CARDS + [ACE]).freeze
SPADE        = "\u2660"
HEART        = "\u2661"
DIAMOND      = "\u2662"
CLUB         = "\u2663"
SUITS        = [SPADE, HEART, DIAMOND, CLUB].freeze
DECK         = SUITS.product(VALUES).freeze
DEALER       = "dealer"
PLAYER       = "you"
DEALER_START_CASH = 250
PLAYER_START_CASH = 100

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system('clear') || system('cls')
end

def prompt_to_continue
  puts SEPARATOR
  prompt "Press 'Enter' to continue"
  gets
end

def display_score_banner(cash_amounts)
  limit_msg     = "Take the Dealer's money to win!"
  player_score  = "You : $#{cash_amounts[:player]}"
  dealer_score  = "Dealer : $#{cash_amounts[:dealer]}"

  puts SEPARATOR
  puts player_score.ljust(ZONE_WIDTH) +
       limit_msg.center(ZONE_WIDTH*2) +
       dealer_score.rjust(ZONE_WIDTH)
  puts SEPARATOR
end

def shuffle_deck
  DECK.shuffle
end

def deal_two_cards(deck)
  Array.new(2) { deck.pop }
end

def total(cards)
  sum = 0
  card_values = cards.map { |card| card[1] }

  card_values.each do |value|
    sum += value.to_i
    sum += 10 if FACE_CARDS.include?(value)
    sum += 11 if value == ACE
  end

  card_values.select { |value| value == ACE }.count.times do
    sum -= 10 if sum > SCORE_LIMIT
  end

  sum
end

def busted?(cards)
  total(cards) > SCORE_LIMIT
end

def detect_result(dealer_cards, player_cards)
  dealer_total = total(dealer_cards)
  player_total = total(player_cards)

  if player_total > SCORE_LIMIT
    :player_busted
  elsif dealer_total > SCORE_LIMIT
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def adjust_cash_amounts(cash_amounts, dealer_cards, player_cards)
  case detect_result(dealer_cards, player_cards)
  when :player_busted, :dealer
    cash_amounts[:player] -= ROUND_WAGER
    cash_amounts[:dealer] += ROUND_WAGER
  when :dealer_busted, :player
    cash_amounts[:player] += ROUND_WAGER
    cash_amounts[:dealer] -= ROUND_WAGER
  end
end

def play_again?
  puts "-------------"
  prompt "Play again? (y/n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def welcome_player(cash_amounts)
  clear_screen
  display_score_banner(cash_amounts)
  puts <<-WELCOME_AND_RULES
  Welcome to "#{SCORE_LIMIT}"!
  How to play:
  - The goal is to score closest to #{SCORE_LIMIT}, without going over
    ~ A player that goes over #{SCORE_LIMIT} "busts" & the other player wins
  - You and the Dealer will both receive two cards
    ~ You can see both of your cards, but only one of the Dealer's
    ~ Number cards are worth their numeric values
    ~ Face cards are worth 10
    ~ Aces are worth 11 or 1, depending on their effect on the total score
  - Players will choose to "hit" (get another card) or "stay" (end their turn)
    ~ The Dealer will "stay" after reaching or passing #{DEALER_LIMIT} points
  - Each round is worth $#{ROUND_WAGER}
    ~ When a player reaches $0 they lose the game, and the other player wins
  - Take the Dealer's money!
  WELCOME_AND_RULES
  prompt_to_continue
end

def display_cards(cards, owner)
  puts SEPARATOR_THICK
  puts owner.upcase.center(GAME_WIDTH)
  puts SEPARATOR_THICK
  puts "#{cards}".center(GAME_WIDTH)
  puts "Total : #{total(cards)} pts".center(GAME_WIDTH)
end

def display_table(cash_amounts, dealer_cards, player_cards)
  clear_screen
  display_score_banner(cash_amounts)
  display_cards(dealer_cards, DEALER)
  display_cards(player_cards, PLAYER)
  puts SEPARATOR
end

def game_over?(cash_amounts)
  cash_amounts.any? { |k,v| v == 0 }
end

cash_amounts = { player: PLAYER_START_CASH, dealer: DEALER_START_CASH }
welcome_player(cash_amounts)
loop do
  deck         = shuffle_deck
  player_cards = deal_two_cards(deck)
  dealer_cards = deal_two_cards(deck)

  display_table(cash_amounts, dealer_cards, player_cards)

  loop do
    player_turn = nil
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      player_turn = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn)
      prompt "Sorry, must enter 'h' or 's'."
    end

    if player_turn == 'h'
      player_cards << deck.pop
      display_table(cash_amounts, dealer_cards, player_cards)
    end

    break if player_turn == 's' || busted?(player_cards)
  end

  if busted?(player_cards)
    adjust_cash_amounts(cash_amounts, dealer_cards, player_cards)
    display_table(cash_amounts, dealer_cards, player_cards)
    display_result(dealer_cards, player_cards)
    break if game_over?(cash_amounts)
    play_again? ? next : break
  else
    prompt "You stayed at #{total(player_cards)}"
  end

  prompt "Dealer turn..."

  loop do
    break if busted?(dealer_cards) || total(dealer_cards) >= DEALER_LIMIT

    prompt "Dealer hits! ..."
    sleep(2)
    dealer_cards << deck.pop
    display_table(cash_amounts, dealer_cards, player_cards)
  end

  if busted?(dealer_cards)
    adjust_cash_amounts(cash_amounts, dealer_cards, player_cards)
    display_table(cash_amounts, dealer_cards, player_cards)
    display_result(dealer_cards, player_cards)
    break if game_over?(cash_amounts)
    play_again? ? next : break
  else
    prompt "Dealer stays at #{total(dealer_cards)}"
    sleep(2)
  end

  adjust_cash_amounts(cash_amounts, dealer_cards, player_cards)
  display_table(cash_amounts, dealer_cards, player_cards)
  display_result(dealer_cards, player_cards)
  break if game_over?(cash_amounts)

  break unless play_again?
end

prompt "Thank you for playing Twenty-One! Good bye!"
