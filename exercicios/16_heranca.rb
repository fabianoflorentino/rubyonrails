# frozen_string_literal: true

# Pessoa
class Pessoa
  attr_accessor :nome, :email
end

# PessoaFisica
class PessoaFisica < Pessoa
  attr_accessor :cpf
end

# PessoaJuridica
class PessoaJuridica < Pessoa
  attr_accessor :cnpj
end
