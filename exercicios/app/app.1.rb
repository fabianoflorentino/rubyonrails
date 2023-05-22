# frozen_string_literal: true

require 'json'
require_relative '../11_pessoa'

nome = ARGV[0].to_s # If you want the program accepts one argument
falando = 'Isso é um JSON file' # A text to falar method
cumprimentando = "Olá, meu nome é #{nome}"

# Instance a new object
estudante = Pessoa.new

# Creates a JSON
pessoa = {
  falar: estudante.falar(falando), andar: estudante.andar,
  cumprimentar: estudante.cumprimentar(cumprimentando)
}

# Print the JSON
puts JSON.pretty_generate(pessoa)
