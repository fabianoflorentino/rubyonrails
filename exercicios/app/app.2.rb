# frozen_string_literal: true

# Import GEMS
require 'json'
require_relative '../12_pessoa'

nome = ARGV[0]

estudante = Pessoa.new(nome)
pessoa = { id: estudante.myid }

puts JSON.pretty_generate(pessoa)
