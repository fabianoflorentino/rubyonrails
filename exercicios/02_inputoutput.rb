# frozen_string_literal: true

# Print line with 120 caracters '*'
puts '*' * 120

# Print the message "Digite seu nome: " to the console and store the user input in the variable nome
print "\nDigite seu nome: "
nome = gets.chomp
print "\n"

# Print line with 120 caracters '*'
puts '*' * 120

# Print the message "Olá <nome>!" to the console
puts "\nOlá #{nome}!\n\n"

# Print line with 120 caracters '*'
puts '*' * 120

# Print the inspect of the variable nome
puts "\nCom inspect: #{nome.inspect}\n\n"

# Print line with 120 caracters '*'
puts '*' * 120

print "\nDigite sua idade: "
idade = gets.chomp.to_i
print "\n"

# Print line with 120 caracters '*'
puts '*' * 120

# Using unless statement to check if the user input is different from integer
puts "\nVocê nasceu em #{Time.now.year - idade}\n\n" unless idade.zero?

# Print line with 120 caracters '*'
puts '*' * 120
