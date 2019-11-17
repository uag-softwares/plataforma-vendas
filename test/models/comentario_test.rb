require 'test_helper'

class ComentarioTest < ActiveSupport::TestCase
  test 'nao deve salvar comentario sem titulo e sem texto' do
    usuario = Usuario.new email: 'usuario@gmail.com', password: '123456', nome: 'user', admin: false
    assert usuario.save
    comentario = Comentario.new usuario: usuario
    assert_not comentario.save
  end

  test 'deve salvar apenas um comentario' do
    usuario = Usuario.new email: 'usuario@gmail.com', password: '123456', nome: 'user', admin: false
    assert usuario.save
    comentario = Comentario.new titulo: 'titulo', texto: 'texto', usuario: usuario
    assert_diference('Comentario.count', 1) do
      assert comentario.save
    end
  end

  test 'salvando comentario com titulo e texto' do
    usuario = Usuario.new email: 'usuario@gmail.com', password: '123456', nome: 'user', admin: false
    assert usuario.save
    comentario = Comentario.new titulo: 'titulo', texto: 'texto', usuario: usuario
    assert comentario.save
  end

  test 'comentario deletando corretamente' do
    usuario = Usuario.new email: 'usuario@gmail.com', password: '123456', nome: 'user', admin: false
    assert usuario.save
    comentario = Comentario.new titulo: 'titulo', texto: 'texto', usuario: usuario
    assert comentario.save
    assert comentario.destroy
  end

  test 'nao salvar comentario sem usuario' do
    comentario = Comentario.new titulo: 'titulo', texto: 'texto'
    assert_not comentario.save
  end
end
