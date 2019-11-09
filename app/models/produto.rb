class Produto < ApplicationRecord
  before_destroy :nao_e_referenciado
  has_many :comentarios, as: :comentavel, dependent: :destroy
  has_many :items, dependent: :destroy
  validates :codigo, presence: true
  validates :nome, presence: true
  validates :marca, presence: true
  validates :quantidade_estoque, presence: true
  validates :preco, presence: true

  private

  def nao_e_referenciado
    unless items.empty?
      errors.add(:base, "Existem itens que referenciam esse produto")
      throw :abort
    end
  end
end