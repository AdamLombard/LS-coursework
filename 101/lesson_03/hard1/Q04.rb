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

# Got locked on to the idea of making a one-line
