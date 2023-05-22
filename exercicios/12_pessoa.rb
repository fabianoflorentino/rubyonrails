# frozen_string_literal: true

# Pessoa
class Pessoa
  attr_reader :nome

  def initialize(nome = 'None')
    @nome = nome
  end

  def myid
    "Meu ID é: #{@nome.object_id}"
  end
end
