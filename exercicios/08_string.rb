# frozen_string_literal: true

nome = 'florentino'
language = 'RubyOnRails'

puts '-' * 120
puts nome
puts nome.class

puts '-' * 120
puts language
puts language.class

puts '-' * 120
titulo = 'Curso'
subtitulo = 'Rails'

puts '-' * 120
begin
  puts titulo << subtitulo
rescue FrozenError
  puts 'The string literal is frozen by frozen_string_literal magic comment on top the program.'
end

puts titulo + subtitulo
