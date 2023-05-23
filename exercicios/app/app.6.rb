# frozen_string_literal: true

require 'json'
require 'cpf_cnpj'
require_relative '../16_heranca'

nome = ARGV[0]
email = ARGV[1]
cpf = ARGV[2] if CPF.valid?(ARGV[2])
cnpj = ARGV[2] if CNPJ.valid?(ARGV[2])

puts '-' * 120

pessoa = Pessoa.new
pessoa.nome = nome
pessoa.email = email

data = { nome: pessoa.nome, email: pessoa.email }

puts JSON.pretty_generate(data)

puts '-' * 120

pessoa_fisica = PessoaFisica.new
pessoa_fisica.nome = nome
pessoa_fisica.email = email
pessoa_fisica.cpf = cpf

pessoa_fisica_data = { nome: pessoa_fisica.nome, email: pessoa_fisica.email, cpf: pessoa_fisica.cpf }

puts JSON.pretty_generate(pessoa_fisica_data)

puts '-' * 120

pessoa_juridica = PessoaJuridica.new
pessoa_juridica.nome = nome
pessoa_juridica.email = email
pessoa_juridica.cnpj = cnpj

pessoa_juridica_data = { nome: pessoa_juridica.nome, email: pessoa_juridica.email, cnpj: pessoa_juridica.cnpj }

puts JSON.pretty_generate(pessoa_juridica_data)

puts '-' * 120
