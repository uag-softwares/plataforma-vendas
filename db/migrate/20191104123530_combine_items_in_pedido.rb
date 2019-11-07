class CombineItemsInPedido < ActiveRecord::Migration[5.1]
  def up
    Pedido.all.each do |pedido|
      sums = pedido.items.group(:produto_id).sum(:quantidade)
      sums.each do |produto_id, quantidade|
        if quantidade > 1
          pedido.items.where(produto_id: produto_id).delete_all

          item = pedido.items.build(produto_id: produto_id)
          item.quantidade = quantidade
          item.save!
        end
      end
    end
  end

  def down
    Item.where("quantidade>1").each do |item|
      item.quantidade.times do
        Item.create(
            pedido_id: item.pedido_id,
            produto_id: item.produto_id,
            quantidade: 1
        )
      end
      item.destroy
    end
  end
end
