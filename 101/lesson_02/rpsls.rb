GAME_WIDTH            = 63
SEPARATOR             = ("-" * GAME_WIDTH)
DISPLAY_CHOICES       = %w((R)ock (P)aper (S)cissors (L)izard Spoc(k))
WIN_SCENARIOS         = { rock:     { scissors: "crushes",
                                      lizard:   "crushes"     },
                          paper:    { rock:     "covers",
                                      spock:    "disproves"   },
                          scissors: { paper:    "cuts",
                                      lizard:   "decapitates" },
                          lizard:   { paper:    "eats",
                                      spock:    "poisons"     },
                          spock:    { scissors: "smashes",
                                      rock:     "vaporizes"   } }
TRANSLATIONS          = { r: "rock",
                          p: "paper",
                          s: "scissors",
                          l: "lizard",
                          k: "spock" }
VALID_CHOICES         = TRANSLATIONS.flatten.map(&:to_s)
WINNER_USER           = "You win!"
WINNER_COMPUTER       = "Computer wins!"
WINNER_NONE           = ["Wow, this is tense!",
                         "Whoo! Close one!",
                         "How frustrating is that?!",
                         "You're starting to think like the machine...",
                         "(I know a doctor who wears a tie. Ties are cool.)"]

def prompt(message)
  puts("=> #{message}")
end

def clear_screen
  system('clear') || system('cls')
end

def win?(first, second)
  WIN_SCENARIOS[first.to_sym].key?(second.to_sym)
end

def action_description(gesture1, gesture2)
  action = WIN_SCENARIOS[gesture1.to_sym][gesture2.to_sym]
  "#{gesture1.capitalize} #{action} #{gesture2.capitalize}!"
end

def calculate_winner(player, computer)
  if win?(player, computer)
    WINNER_USER
  elsif win?(computer, player)
    WINNER_COMPUTER
  else
    WINNER_NONE.sample
  end
end

def translate_choice(value)
  TRANSLATIONS.fetch(value.to_sym, value)
end

def refresh_display(user, computer)
  clear_screen
  u_score     = "Player : #{user}"
  s_score     = "Computer : #{computer}"
  limit_msg   = "First to 5 wins!"
  zone_width  = (GAME_WIDTH / 3)
  puts(SEPARATOR)
  puts(u_score.ljust(zone_width) +
       limit_msg.center(zone_width) +
       s_score.rjust(zone_width))
  puts(SEPARATOR)
end

def continue?
  yes_no = ''
  prompt("Continue? (Y/N)")
  loop do
    yes_no = gets.chomp.downcase
    break if yes_no == 'y' || yes_no == 'n'
    prompt("Please reply with 'Y' or 'N'...")
  end
  yes_no == 'y' ? TRUE : FALSE
end

def user_input
  user_choice = ''
  loop do
    prompt("Choose one: #{DISPLAY_CHOICES.join(', ')}")
    user_choice = gets.chomp.downcase

    break if VALID_CHOICES.include?(user_choice)
    prompt("That's not a valid choice...")
  end
  user_choice
end

def display_final_scores(user, computer)
  if user > computer
    vs_score = "#{user} to #{computer}"
    prompt("You won the tournament, #{vs_score}! Nice job!")
  else
    vs_score = "#{computer} to #{user}"
    prompt("The computer won the tournament, #{vs_score}.")
    prompt("Oh no, the machines are taking over!!!")
  end
end

user_score      = 0
computer_score  = 0
loop do
  refresh_display(user_score, computer_score)

  user_choice = translate_choice(user_input)
  comp_choice = translate_choice(VALID_CHOICES.sample)

  win_msg = calculate_winner(user_choice, comp_choice)
  if win_msg == WINNER_USER
    action = action_description(user_choice, comp_choice)
    user_score += 1
  elsif win_msg == WINNER_COMPUTER
    action = action_description(comp_choice, user_choice)
    computer_score += 1
  else
    action = "A tie!"
  end

  refresh_display(user_score, computer_score)
  prompt("Player   : #{user_choice}")
  prompt("Computer : #{comp_choice}")
  puts
  prompt("#{action} #{win_msg}")
  puts

  if user_score < 5 && computer_score < 5
    break unless continue?
  else
    display_final_scores(user_score, computer_score)
    break
  end
end
