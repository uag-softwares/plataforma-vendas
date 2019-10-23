require 'test_helper'

class ProdutoTest < ActiveSupport::TestCase

  test 'nao deve salvar produto sem nome' do
    produto = Produto.create :codigo => 123, :marca => "marca", nome: 'nome', :quantidade_estoque => 12, :preco => 10.0
    assert produto.save
  end
end
