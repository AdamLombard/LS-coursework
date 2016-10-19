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

def win?(first, second)
  puts WIN_SCENARIOS[first.to_sym][second.to_sym]

  WIN_SCENARIOS[first.to_sym].has_key?(second.to_sym)
end

puts win?("rock", "scissors")
