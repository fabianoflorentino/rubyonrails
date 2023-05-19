# frozen_string_literal: true

# Print the message "Digite sua idade: " to the console and store the user input in the variable idade
print 'Digite sua idade: '
idade = gets.chomp.to_i

# Using unless statement to check if the user input is different from integer
puts "Você nasceu em #{Time.now.year - idade}" unless idade.zero?

# Using if statement to check if the user input is zero
puts 'Entre com um valor inteiro maior que zero!' if idade.zero?

# Using case statement to check the user age and print the generation
case Time.now.year - idade
when 1946..1964
  puts 'Sua geração é Baby Boomer'
when 1965..1979
  puts 'Sua geração é Geração X'
when 1980..1994
  puts 'Sua geração é Geração Y'
when 1995..2009
  puts 'Sua geração é Geração Z'
when 2010..2025
  puts 'Sua geração é Geração Alpha'
else
  puts 'Você não é dessa galáxia!'
end
