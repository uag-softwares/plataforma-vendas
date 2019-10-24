require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase

  test 'apenas um usuario existe' do
    usuario = Usuario.new email: 'usuario@gmail.com', password: '123456', nome: 'user', admin: false
    assert usuario.save
    usuarios = Usuario.all
    assert (usuarios.length == 1)
  end

  test 'nao deve salvar usuario sem nome' do
    usuario = Usuario.new email: 'usuario@gmail.com', password: '123456', admin: false
    assert_not usuario.save
  end

  test 'usuario normal nao e administrador' do
    usuario = Usuario.new email: 'usuario@gmail.com', password: '123456', nome: 'user', admin: false
    assert usuario.save
    assert (usuario.admin == false)
  end

  test 'nao deve salvar usuario violacao de senha pequena' do
    usuario = Usuario.new email: 'usuario@gmail.com', password: '12345', nome: 'user', admin: false
    assert_not usuario.save
  end
end
