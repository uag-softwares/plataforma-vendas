class AddQuantidadeToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :quantidade, :integer, default: 1
  end
end
