require 'test_helper'

class ProdutosControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @produto = produtos(:produto_um)
    @produto2 = produtos(:produto_dois)
    @admin = usuarios(:usuario_um)
    @usuario = usuarios(:usuario_dois)
  end

  test "should get index" do
    get produtos_url
    assert_response :success
  end

  test "should get new" do
    sign_in @admin
    get new_produto_url
    assert_response :success
  end

  test "should show produto" do
    get produto_url(@produto)
    assert_response :success
  end

  test "should get edit" do
    sign_in @admin
    get edit_produto_url(@produto)
    assert_response :success
  end

  test "should update produto" do
    sign_in @admin
    patch produto_url(@produto), params: {produto: {codigo: @produto.codigo, marca: @produto.marca, nome: @produto.nome, preco: @produto.preco, quantidade_estoque: @produto.quantidade_estoque}}
    assert_redirected_to produto_url(@produto)
  end

  test "should not update produto" do
    sign_in @admin
    patch produto_url(@produto), params: {produto: {codigo: '', marca: @produto.marca, nome: @produto.nome, preco: @produto.preco, quantidade_estoque: @produto.quantidade_estoque}}
    assert_response 422
  end

  test "should create produto" do
    sign_in @admin
    post produtos_url, params: {produto: {codigo: 123, marca: 'marca', nome: 'nome', preco: 15.5, quantidade_estoque: 5}}
    assert_redirected_to Produto.last
  end

  test "should destroy produto" do
    sign_in @admin
    assert_difference('Produto.count', -1) do
      delete produto_url(@produto)
    end

    assert_redirected_to produtos_url
  end
end
