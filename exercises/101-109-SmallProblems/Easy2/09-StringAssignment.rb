# The code...
name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# ... will print...
# BOB
# BOB
# ... because both variables refer to the same string, and #upcase! modifies the
# string in place