require 'test_helper'

class ProdutoTest < ActiveSupport::TestCase

  setup do
    @produto = produtos(:produto_um)
  end

  test 'deve salvar produto' do
    produto = Produto.new codigo: '40028922', nome: 'Blusa', marca: 'marcablusa', quantidade_estoque: 8, preco: 34.90
    assert produto.save
  end

  test 'nao salvar produto sem codigo' do
    produto = Produto.new nome: 'Blusa', marca: 'marcablusa', quantidade_estoque: 8, preco: 34.90
    assert_not produto.save
  end

  test 'nao deve salvar produto sem preco' do
    produto = Produto.new codigo: '40028922', nome: 'Blusa', marca: 'marcablusa', quantidade_estoque: 8
    assert_not produto.save
  end

  test 'nao deve editar produto deixando preco vazio' do
    assert_not @produto.update preco: ' '
  end

  test 'nao deve editar produto deixando codigo vazio' do
    assert_not @produto.update codigo: ' '
  end

  test 'deve deletar produto corretamente' do
    assert @produto.destroy
  end

  test 'deve deletar produto em cascata' do
    usuario = Usuario.new email: 'usuario@gmail.com', password: '123456', nome: 'user', admin: false
    assert usuario.save
    comentario = Comentario.new titulo: 'titulo', texto: 'texto', usuario: usuario
    assert comentario.save
    produto = Produto.new codigo: '40028922', nome: 'Blusa', marca: 'marcablusa', quantidade_estoque: 8, preco: 34.90
    produto.comentarios << comentario
    assert produto.save
    assert produto.destroy
  end

end
