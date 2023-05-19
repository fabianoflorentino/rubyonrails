# frozen_string_literal: true

# Using each
puts '-' * 120
puts 'Using each'
puts '-' * 120
[1, 2, 3, 4, 5].each do |item|
  puts item if item.instance_of?(Integer)
end

# Using while
puts '-' * 120
puts 'Using while'
puts '-' * 120
init = 0
final_number = 10

while init <= final_number
  puts "Contando...#{init}" if init.instance_of?(Integer)
  init += 1
end
