class Comentario < ApplicationRecord
  belongs_to :comentavel, polymorphic: true, optional: true
  belongs_to :usuario
  has_many :comentarios, as: :comentavel, dependent: :destroy
  validates :texto, presence: true
  validates :titulo, presence: true

  def raiz
    r = self.comentavel
    while r.try(:comentavel)
      r = r.comentavel
    end
    return r
  end
end