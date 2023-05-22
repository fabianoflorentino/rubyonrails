# frozen_string_literal: true

# Pessoa
class Pessoa
  attr_reader :nome

  def initialize(nome = 'Pessoa')
    @nome = nome
  end

  def falar(fala = 'Olá, pessoal')
    fala
  end

  def andar(direcao = 'Andando')
    direcao
  end

  def cumprimentar(cumprimento = "Olá, #{@nome}")
    cumprimento
  end
end
