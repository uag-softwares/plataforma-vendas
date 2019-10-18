class CreateProdutos < ActiveRecord::Migration[5.1]
  def change
    create_table :produtos do |t|
      t.integer :codigo
      t.string :nome
      t.string :marca
      t.integer :quantidade_estoque
      t.decimal :preco

      t.timestamps
    end
  end
end
