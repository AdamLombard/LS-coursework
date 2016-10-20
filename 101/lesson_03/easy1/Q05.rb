(10..100).include?(42)

# Hmm. LS suggests .cover?(), but cover just says whether or not the argument
# WOULD lie between the rangepoints in a sorted, list, not that it DOES in
# fact appear in the range. So, ('a'..'z').cover?('blue') returns TRUE, while
# include? does not, because the actual range is 'a', 'b', 'c', etc.
# So there is a definite differenct between cover?() and include?().
# However! That difference appears to only apply to non-numeric data. For
# numeric data, there appears to be no difference, since include?() will take
# floats, and still return true.
# Interesting...
