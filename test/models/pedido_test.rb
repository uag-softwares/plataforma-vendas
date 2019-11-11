require 'test_helper'

class PedidoTest < ActiveSupport::TestCase

  test 'apenas um pedido existe' do
    usuario = Usuario.new email: 'usuario@gmail.com', password: '123456', nome: 'user', admin: false
    pedido = Pedido.new status: 'criando', usuario: usuario
    assert pedido.save
  end

  test 'nao deve salvar pedido sem usuario' do
    pedido = Pedido.new status: 'criando'
    assert_not pedido.save
  end

  test 'nao deve dar update em pedido com status invalido' do
    usuario = Usuario.new email: 'usuario@gmail.com', password: '123456', nome: 'user', admin: false
    pedido = Pedido.new status: 'criando', usuario: usuario
    assert_not pedido.update status: '', usuario: usuario
  end

end
