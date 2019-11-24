require 'test_helper'

class ComentarioTest < ActiveSupport::TestCase

  setup do
    @usuario = usuarios(:usuario_dois)
    @comentario = comentarios(:comentario_dois)
  end

  test 'nao deve salvar comentario sem titulo e sem texto' do
    comentario = Comentario.new usuario: @usuario
    assert_not comentario.save
  end

  test 'deve salvar apenas um comentario' do
    comentario = Comentario.new titulo: 'titulo', texto: 'texto', usuario: @usuario
    assert_difference('Comentario.count', 1) do
      assert comentario.save
    end
  end

  test 'deve salvar comentario com titulo e texto' do
    comentario = Comentario.new titulo: 'titulo', texto: 'texto', usuario: @usuario
    assert comentario.save
  end

  test 'deve deletar comentario corretamente' do
    @comentario.destroy
  end

  test 'nao deve salvar comentario sem usuario' do
    comentario = Comentario.new titulo: 'titulo', texto: 'texto'
    assert_not comentario.save
  end
end
