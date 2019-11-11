class AddUsuarioToPedidos < ActiveRecord::Migration[5.1]
  def change
    add_reference :pedidos, :usuario, foreign_key: true
  end
end
