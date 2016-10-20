flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}
flintstones.each_with_index { |name, index| flintstones_hash[name] = index }

p flintstones_hash
