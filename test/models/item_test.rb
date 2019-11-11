require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test 'salva item corretamente' do
    produto = Produto.new codigo: '40028922', nome: 'Blusa', marca: 'marcablusa', quantidade_estoque: 8, preco: 34.90
    assert produto.save
    usuario = Usuario.new email: 'usuario@gmail.com', password: '123456', nome: 'user', admin: false
    assert usuario.save
    pedido = Pedido.new status: 'efetuado', usuario: usuario
    assert pedido.save
    item = Item.new quantidade: 10, produto_id:produto.id, pedido_id: pedido.id
    assert item.save
  end
end


