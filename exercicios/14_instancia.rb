# frozen_string_literal: true

# Pessoa
class Pessoa
  attr_reader :nome

  def initialize(nome = None)
    @nome = nome
  end

  def identificacao
    @nome
  end
end
