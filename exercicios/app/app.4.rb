# frozen_string_literal: true

require 'json'
require_relative '../14_instancia'

NOME = ARGV[0]

pessoa = Pessoa.new(NOME)

data = { nome: pessoa.identificacao }

puts JSON.pretty_generate(data)
