# frozen_string_literal: true

# Creates a line with 120 characters '-'.
puts '-' * 120

# Creates a array with list of arrays.
v = [[11, 12, 13, 14, 15], [21, 22, 23, 24, 25], [31, 32, 33, 34, 35]]

# Shows the array content using the each method to show content of the arrays
# inside the array.
v.each do |externo|
  externo.each do |interno|
    puts interno # Shows the content of the array.
  end
end

puts '-' * 120

# Any string text is a array of characters.
s = 'florentino'

# Show the letter in the position 5 of the string.
puts s[5]

puts '-' * 120

# Creates a array with list of numbers.
v = [1, 2, 3, 4, 5, 6, 7, 8, 9]

# Shows the array content using the each method.
v.each do |item|
  puts item # Shows the content of the array.
end

puts '-' * 120
