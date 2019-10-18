json.extract! produto, :id, :codigo, :nome, :marca, :quantidade_estoque, :preco, :created_at, :updated_at
json.url produto_url(produto, format: :json)
