class Pedido < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :usuario
  enum status: [:criando, :efetuado, :aprovado, :cancelado, :entregue]

  def add_produto(produto)
    item_atual = items.find_by(produto_id: produto.id)

    if item_atual
      item_atual.increment(:quantidade)
    else
      item_atual = items.build(produto_id: produto.id)
    end
    item_atual
  end

  def preco_total
    items.to_a.sum { |item| item.preco_total }
  end

  def verificar_quantidade
    items.each do |item|
      if item.quantidade > item.produto.quantidade_estoque
        raise "Quantidade em estoque insuficiente"
      end
    end
  end

  def aceitar_pedido
    if status == 'efetuado'
      verificar_quantidade
      items.each do |item|
        qtd_estoque = item.produto.quantidade_estoque
        qtd_pedido = item.quantidade
        item.produto.update(quantidade_estoque: qtd_estoque - qtd_pedido)
      end
      self.update(status: :aprovado)
    end
  end

  def cancelar_pedido
    if self.status == 'aprovado'
      items.each do |item|
        qtd_estoque = item.produto.quantidade_estoque
        qtd_pedido = item.quantidade
        item.produto.update(quantidade_estoque: qtd_estoque + qtd_pedido)
      end
      self.update(status: :cancelado)
      true
    elsif self.status == 'efetuado'
      self.update(status: :cancelado)
    else
      false
    end
  end
end
