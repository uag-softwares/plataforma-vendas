class Produto < ApplicationRecord
  has_many :comentarios, as: :comentavel
end
