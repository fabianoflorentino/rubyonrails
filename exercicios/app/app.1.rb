# frozen_string_literal: true

require 'json'
require_relative '../11_pessoa'

nome = ARGV[0].to_s
falando = 'Isso é um JSON file'
cumprimentando = "Olá, meu nome é #{nome}"

estudante = Pessoa.new
pessoa = {
  falar: estudante.falar(falando), andar: estudante.andar,
  cumprimentar: estudante.cumprimentar(cumprimentando)
}

puts JSON.pretty_generate(pessoa)
