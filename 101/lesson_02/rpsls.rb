require 'pry'

GAME_WIDTH            = 62
SEPARATOR             = "-"*GAME_WIDTH
DISPLAY_CHOICES       = %w((R)ock (P)aper (S)cissors (L)izard Spoc(k))
VALID_PLAYER_CHOICES  = %w(rock r paper p scissors s lizard l spock k)
WIN_SCENARIOS         = {  rock:     {scissors: "crushes",
                                      lizard:   "crushes"     },
                           paper:    {rock:     "covers",
                                      spock:    "disproves"   },
                           scissors: {paper:    "cuts",
                                      lizard:   "decapitates" },
                           lizard:   {paper:    "eats",
                                      spock:    "poisons"     },
                           spock:    {scissors: "smashes",
                                      rock:     "vaporizes"   } }
WINNER_USER           = "You win"
WINNER_COMPUTER       = "Computer wins"
WINNER_NONE           = "It's a tie"

def prompt(message)
  puts("=> #{message}")
end

def clear_screen
  system('clear') || system('cls')
end

def win?(first, second)
  WIN_SCENARIOS[first.to_sym].has_key?(second.to_sym)
end

def calculate_winner(player, computer)
  if win?(player, computer)
    WINNER_USER
  elsif win?(computer, player)
    WINNER_COMPUTER
  else
    WINNER_NONE
  end
end

def action_description(a1, a2)
  case
  when a1 == 'scissors' && a2 == 'paper' then 'cuts'
  when 'paper' && 'rock'
    binding.pry
    'covers'
  when 'rock' && 'lizard'
    binding.pry
    'crushes'
  when 'lizard' && 'spock'
    binding.pry
    'poisons'
  when 'spock' && 'scissors'
    'smashes'
  when 'scissors' && 'lizard'
    binding.pry
    'decapitates'
  when 'lizard' && 'paper'
    binding.pry
    'eats'
  when 'paper' && 'spock'
    binding.pry
    'disproves'
  when 'spock' && 'rock'
    binding.pry
    'vaporizes'
  when 'rock' && 'scissors'
    binding.pry
    'crushes'
  end
end

def translate_choice(value)
  case value
  when 'r' then 'rock'
  when 'p' then 'paper'
  when 's' then 'scissors'
  when 'l' then 'lizard'
  when 'k' then 'spock'
  else value
  end
end

def display_scores(user, computer)
  user_display  = "Player : #{user}"
  comp_display  = "Computer : #{computer}"
  zone_width    = (GAME_WIDTH / 2)
  puts(SEPARATOR)
  puts(user_display.ljust(zone_width) + comp_display.rjust(zone_width))
  puts(SEPARATOR)
end

def continue?
  yes_no = ''
  prompt("Play again? (Y/N)")
  loop do
    yes_no = gets.chomp.downcase
    break if yes_no == 'y' || yes_no == 'n'
    prompt("Please reply with 'Y' or 'N'...")
  end
  yes_no == 'y' ? TRUE : FALSE
end

user_score      = 0
computer_score  = 0
loop do
  clear_screen
  display_scores(user_score, computer_score)

  user_choice = ''
  loop do
    prompt("Choose one: #{DISPLAY_CHOICES.join(', ')}")
    user_choice = gets.chomp

    if VALID_PLAYER_CHOICES.include?(user_choice)
      break
    else
      prompt("That's not a valid choice...")
    end
  end
  user_choice = translate_choice(user_choice)

  computer_choice = VALID_PLAYER_CHOICES.sample
  computer_choice = translate_choice(computer_choice)

  action = ''
  case calculate_winner(user_choice, computer_choice)
  when WINNER_USER
    win_msg = WINNER_USER
    action  = action_description(user_choice, computer_choice)
    action  = "#{user_choice.capitalize} #{action} #{computer_choice.capitalize}"
    user_score += 1
  when WINNER_COMPUTER
    win_msg = WINNER_COMPUTER
    action  = action_description(computer_choice, user_choice)
    action  = "#{computer_choice.capitalize} #{action} #{user_choice.capitalize}"
    computer_score += 1
  when WINNER_NONE
    action = "Wow"
    win_msg = WINNER_NONE
  end

  clear_screen
  display_scores(user_score, computer_score)
  prompt("Player   : #{user_choice}")
  prompt("Computer : #{computer_choice}")
  puts
  prompt("#{win_msg}! #{action}!")
  puts

  if user_score < 5 && computer_score < 5
    break unless continue?
  else
    if user_score > computer_score
      vs_score = "#{user_score} to #{computer_score}"
      prompt("You won the tournament, #{vs_score}! Nice job!")
    else
      vs_score = "#{computer_score} to #{user_score}"
      prompt("The computer won, #{vs_score}!")
      prompt("Oh no, the machines are taking over!!!")
    end
    break
  end
end
