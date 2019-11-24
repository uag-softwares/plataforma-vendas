require 'test_helper'
include HelperTest

class ItemTest < ActiveSupport::TestCase

  setup do
    @pedido = pedidos(:pedido_dois)
    @usuario = usuarios(:usuario_dois)
    @produto = produtos(:produto_dois)
    @item = items(:item_um)
  end

  test 'deve salvar apenas um item' do
    item = Item.new quantidade: 10, produto_id: @produto.id, pedido_id: @pedido.id
    deve_salvar_apenas_um item
  end

  test 'deve salvar item corretamente' do
    item = Item.new quantidade: 10, produto_id: @produto.id, pedido_id: @pedido.id
    assert item.save
  end

  test 'deve deletar item corretamente' do
    @item.destroy
  end

  test 'nao deve salvar item sem produto_id' do
    item = Item.new quantidade: 10, pedido_id: @pedido.id
    assert_not item.save
  end

  test 'nao deve salvar item sem pedido_id' do
    item = Item.new quantidade: 10, produto_id: @produto.id
    assert_not item.save
  end
end


