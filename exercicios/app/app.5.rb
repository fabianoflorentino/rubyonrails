# frozen_string_literal: true

require 'json'
require_relative '../15_accessor'

pessoa = Pessoa.new
pessoa.nome = ARGV[0]

data = { nome: pessoa.nome }

puts JSON.pretty_generate(data)
