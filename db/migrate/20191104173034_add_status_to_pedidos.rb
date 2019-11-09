class AddStatusToPedidos < ActiveRecord::Migration[5.1]
  def change
    add_column :pedidos, :status, :integer, default: 0
  end
end
