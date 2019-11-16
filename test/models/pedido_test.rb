require 'test_helper'

class PedidoTest < ActiveSupport::TestCase

  setup do
    @pedido = pedidos(:pedido_dois)
    @usuario = usuarios(:usuario_dois)
    @produto = produtos(:produto_dois)
    @item = items(:item_um)
  end

  test 'deve adicionar produto ao pedido' do
    item = @pedido.add_produto(@produto)
    assert_equal @item.quantidade + 1, item.quantidade
  end

  test 'deve calcular o preco total do pedido' do
    assert_equal 29.97, @pedido.preco_total
  end

  test 'deve aceitar o pedido e diminuir a quantidade em estoque dos produtos' do
    @pedido.aceitar_pedido
    assert_equal 'aprovado', @pedido.status
    assert_equal 9, @pedido.items.find_by_id(@item.id).produto.quantidade_estoque
  end

  test 'deve cancelar o pedido e aumentar a quantidade em estoque dos produtos' do
    @pedido.aceitar_pedido
    @pedido.cancelar_pedido
    assert_equal 'cancelado', @pedido.status
  end

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
