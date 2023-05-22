# frozen_string_literal: true

require 'json'
require_relative '../10_pessoa'

nome = ARGV[0]
idade = ARGV[1].to_i

estudante = Pessoa.new(nome, idade)

my_json = { nome: estudante.nome, idade: estudante.idade }

puts JSON.pretty_generate(my_json)
