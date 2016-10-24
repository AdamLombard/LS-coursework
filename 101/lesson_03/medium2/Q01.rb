munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

total_male_ages = 0
munsters.each do |name, info|
  if info["gender"] == "male"
    total_male_ages += info["age"]
  end
end

# LS recommends a single line...
# total_male_ages += info["age"] if info["gender"] == "male"
# I'm having a hard time getting used to this idiom, where the 'if' logic
# comes AFTER the expression. Something to work on...

puts total_male_ages
