# frozen_string_literal: true

puts '-' * 120

v = [[11, 12, 13, 14, 15], [21, 22, 23, 24, 25], [31, 32, 33, 34, 35]]

v.each do |externo|
  externo.each do |interno|
    puts interno
  end
end

puts '-' * 120

s = 'florentino'

puts s[5]

puts '-' * 120

v = [1, 2, 3, 4, 5, 6, 7, 8, 9]

v.each do |item|
  puts item
end

puts '-' * 120
