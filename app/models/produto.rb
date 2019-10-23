class Produto < ApplicationRecord
  has_many :comentarios
  validates :codigo, presence: true
  validates :nome, presence: true
  validates :marca, presence: true
  validates :quantidade_estoque, presence: true
  validates :preco, presence: true
end