require 'test_helper'

class ComentarioTest < ActiveSupport::TestCase
  test 'nao deve salvar comentario sem titulo e sem texto' do
    usuario = Usuario.new email: 'usuario@gmail.com', password: '123456', nome: 'user', admin: false
    assert usuario.save
    comentario = Comentario.new usuario: usuario
    assert_not comentario.save
  end

  test 'apenas um comentario existe' do
    usuario = Usuario.new email: 'usuario@gmail.com', password: '123456', nome: 'user', admin: false
    assert usuario.save
    comentario = Comentario.new titulo: 'titulo', texto: 'texto', usuario: usuario
    assert comentario.save
    tamanho = Comentario.all
    assert (tamanho.length)
  end

  test 'salvando comentario cm titulo e texto' do
    usuario = Usuario.new email: 'usuario@gmail.com', password: '123456', nome: 'user', admin: false
    assert usuario.save
    comentario = Comentario.new titulo: 'titulo', texto: 'texto', usuario: usuario
    assert comentario.save
  end
end
