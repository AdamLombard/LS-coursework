V  = {  r: "rock",
                           p: "paper",
                           s: "scissors",
                           l: "lizard",
                           k: "spock" }

x = V.flatten.map{ |e| e.to_s }.sample

puts x
