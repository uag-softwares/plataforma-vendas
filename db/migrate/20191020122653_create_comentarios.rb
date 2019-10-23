class CreateComentarios < ActiveRecord::Migration[5.1]
  def change
    create_table :comentarios do |t|
      t.string :titulo
      t.string :texto
      t.references :produto, foreign_key: true
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
