require 'test_helper'

class PedidoTest < ActiveSupport::TestCase

  setup do
    @pedido = pedidos(:pedido_dois)
    @usuario = usuarios(:usuario_dois)
    @produto = produtos(:produto_um)
    @item = items(:item_um)
  end

  test 'deve adicionar produto ao pedido' do
    assert_difference(@pedido.items, 1) do
      @pedido.add_produto(@produto)
    end
  end

  test 'deve calcular o preco total do pedido' do
    @pedido.items.add(item)
    assert (9.99*3) @pedido.preco_total
  end

  test 'deve aceitar o pedido e diminuir a quantidade em estoque dos produtos' do
    @pedido.items.add(item)
    assert_difference(@produto.quantidade_em_estoque, -3) do
      @pedido.aceitar_pedido
      assert 'aceito' @pedido.status
    end
  end

  test 'deve cancelar o pedido e aumentar a quantidade em estoque dos produtos' do
    @pedido.items.add(item)
    assert_difference(@produto.quantidade_em_estoque, +3) do
      @pedido.aceitar_pedido
      assert 'cancelado' @pedido.status
    end
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
