# frozen_string_literal: true

# Pessoa
class Pessoa
  attr_reader :nome, :idade

  def initialize(nome, idade)
    @nome = nome
    @idade = idade
  end
end
