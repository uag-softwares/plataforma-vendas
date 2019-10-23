class AddComentavelIdAndComentavelTypeToComentarios < ActiveRecord::Migration[5.1]
  def change
    add_column :comentarios, :comentavel_id, :integer
    add_column :comentarios, :comentavel_type, :string
  end
end
