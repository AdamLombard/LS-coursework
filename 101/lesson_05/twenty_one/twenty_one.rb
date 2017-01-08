NUM_CARDS  = %w(2 3 4 5 6 7 8 9).freeze
FACE_CARDS = %w(J Q K).freeze
ACE        = 'A'.freeze
VALUES     = (NUM_CARDS + FACE_CARDS + [ACE]).freeze
SUITS      = %w(S C H D).freeze
DECK       = SUITS.product(VALUES).freeze

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system('clear') || system('cls')
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
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(cards)
  total(cards) > 21
end

def detect_result(dealer_cards, player_cards)
  dealer_total = total(dealer_cards)
  player_total = total(player_cards)

  if player_total > 21
    :player_busted
  elsif dealer_total > 21
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

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

loop do
  clear_screen

  deck         = shuffle_deck
  player_cards = deal_two_cards(deck)
  dealer_cards = deal_two_cards(deck)

  prompt "Dealer cards: #{dealer_cards[0]} and ??"
  prompt "Your cards  : #{player_cards[0]} and #{player_cards[1]}."
  prompt "Your total  : #{total(player_cards)}"

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
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{total(player_cards)}"
    end

    break if player_turn == 's' || busted?(player_cards)
  end

  if busted?(player_cards)
    prompt "Dealer total is now: #{total(dealer_cards)}"
    display_result(dealer_cards, player_cards)
    play_again? ? next : break
  else
    prompt "You stayed at #{total(player_cards)}"
  end

  prompt "Dealer turn..."

  loop do
    break if busted?(dealer_cards) || total(dealer_cards) >= 17

    prompt "Dealer hits!"
    dealer_cards << deck.pop
    prompt "Dealer's cards are now: #{dealer_cards}"
  end

  if busted?(dealer_cards)
    prompt "Dealer total is now: #{total(dealer_cards)}"
    display_result(dealer_cards, player_cards)
    play_again? ? next : break
  else
    prompt "Dealer stays at #{total(dealer_cards)}"
  end

  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
  prompt "Player has #{player_cards}, for a total of: #{total(player_cards)}"
  puts "=============="

  display_result(dealer_cards, player_cards)

  break unless play_again?
end

prompt "Thank you for playing Twenty-One! Good bye!"
