advice = "Few things in life are as important as house training your pet dinosaur."

p advice.include?("Dino")

# LS recommends...
p advice.match("Dino")
# ... but that seems like overkill, because it returns a MatchData object, when
# all we were asked was to see if a given string appeared in another string.
# In that case, .include?() feels more idiomatic, and expressive, since it
# returns a simple Boolean.
