class Pedido < ApplicationRecord
  has_many :items, dependent: :destroy
end
