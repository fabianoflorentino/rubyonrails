# frozen_string_literal: true

# Pessoa
class Pessoa
  attr_accessor :nome, :email
end

# PessoaFisica
# Inheriting from class Pessoa
class PessoaFisica < Pessoa
  attr_accessor :cpf # attribute for PessoaFisica
end

# PessoaJuridica
# Inheriting from class Pessoa
class PessoaJuridica < Pessoa
  attr_accessor :cnpj # attribute for PessoaJuridica
end
