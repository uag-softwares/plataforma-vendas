class Comentario < ApplicationRecord
  belongs_to :comentavel, polymorphic: true, optional: true
  belongs_to :usuario
  has_many :comentarios, as: :comentavel
end
