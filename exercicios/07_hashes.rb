# frozen_string_literal: true

# Creates a line with 120 characters '-'.
puts '-' * 120

# Creates a hash with the key and value.
hs = { nome: 'Florentino', idade: 50, peso: 80.5 }

# Shows the hash content using the each method.
hs.each do |chave, valor|
  @ch = chave # Set the global variable @ch with the key value.
  @vl = valor # Set the global variable @vl with the value.

  # Shows the content of the global variables @ch and @vl.
  puts "#{@ch} => #{@vl}"
  puts '-' * 120

  # Shows the class of the global variables @ch and @vl.
  puts "@ch: #{@ch.class} => @vl: #{@vl.class}"

  puts '-' * 120
end
