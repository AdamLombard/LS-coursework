def uuid
  hex_values = [*0..9].map(&:to_s) + [*'a'..'f']
  dashes_at  = [8, 12, 16, 20]

  uuid = ''
  32.times do |i|
    uuid << hex_values.sample
    uuid << '-' if dashes_at.include?(i + 1)
  end
  uuid
end

# Got locked on to the idea of making a one-line method for this...
def uuid
  Array.new(32) { rand(16).to_s(16) }.join.unpack('a8a4a4a4a*').join('-')
end
