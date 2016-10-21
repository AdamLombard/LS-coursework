ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.delete_if { |_, age| age >= 100 }

# LS recommended...
p ages.keep_if { |_, age| age < 100}
