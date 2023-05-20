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
