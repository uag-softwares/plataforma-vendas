class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
      t.boolean :admin
      t.string :nome

      t.timestamps
    end
  end
end
