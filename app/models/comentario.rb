class Comentario < ApplicationRecord
  belongs_to :produto
  belongs_to :usuario
  validates :texto, presence: true
  validates :titulo, presence: true
end
