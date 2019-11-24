require 'test_helper'
include HelperTest

class UsuarioTest < ActiveSupport::TestCase

  test 'deve salvar apenas um usuario' do
    usuario = Usuario.new email: 'usuario@gmail.com', password: '123456', nome: 'user', admin: false
    deve_salvar_apenas_um usuario
  end

  test 'nao deve salvar usuario sem nome' do
    usuario = Usuario.new email: 'usuario@gmail.com', password: '123456', admin: false
    assert_not usuario.save
  end

  test 'usuario normal nao e administrador' do
    usuario = Usuario.new email: 'usuario@gmail.com', password: '123456', nome: 'user', admin: false
    assert usuario.save
    assert_not usuario.admin
  end

  test 'usuario e administrador' do
    usuario = Usuario.new email: 'usuario@gmail.com', password: '123456', nome: 'user', admin: true
    assert usuario.save
    assert usuario.admin
  end

  test 'nao deve salvar usuario com violacao de senha pequena' do
    usuario = Usuario.new email: 'usuario@gmail.com', password: '12345', nome: 'user', admin: false
    assert_not usuario.save
  end
end
