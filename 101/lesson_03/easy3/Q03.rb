flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino" << "Hoppy"

# weak! LS recommends
flintstones.push("Dino").push("Hoppy")
# or...
flintstones.concat(%w(Dino Hoppy))
