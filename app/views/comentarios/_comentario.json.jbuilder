json.extract! comentario, :id, :titulo, :texto, :produto_id, :created_at, :updated_at
json.url comentario_url(comentario, format: :json)
