def uuid
  Array.new(32) { rand(16).to_s(16) }.join.unpack('a8a4a4a4a*').join('-')
end

puts uuid
