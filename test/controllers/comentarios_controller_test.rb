require 'test_helper'

class ComentariosControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @produto = produtos(:produto_um)
    @produto2 = produtos(:produto_dois)
    @admin = usuarios(:usuario_um)
    @usuario = usuarios(:usuario_dois)
    @comentario = comentarios(:comentario_um)
    @comentario2 = comentarios(:comentario_dois)
  end

  test "should get new produto comentario" do
    sign_in @admin
    get new_produto_comentario_url(@produto)
    assert_response :success
  end

  test "should get new comentario comentario" do
    sign_in @admin
    get new_comentario_comentario_url(@comentario)
    assert_response :success
  end

  test "should create produto comentario" do
    sign_in @admin
    assert_difference('Comentario.count') do
      post produto_comentarios_url(@produto), params: {comentario: {produto_id: @comentario.produto_id, texto: @comentario.texto, titulo: @comentario.titulo, usuario_id: @comentario.usuario_id}}
    end

    assert_redirected_to produto_url(@produto)
  end

  test "should create comentario comentario" do
    sign_in @admin
    assert_difference('Comentario.count') do
      post comentario_comentarios_url(@comentario), params: {comentario: {comentario_id: @comentario.id, texto: @comentario2.texto, titulo: @comentario2.titulo, usuario_id: @comentario2.usuario_id}}
    end

    assert_redirected_to produto_url(@produto)
  end

  test "should get edit produto comentario" do
    sign_in @admin
    get edit_produto_comentario_url(@produto, @comentario)
    assert_response :success
  end

  test "should get edit comentario comentario" do
    sign_in @admin
    get edit_comentario_comentario_url(@comentario, @comentario2)
    assert_response :success
  end

  test "should update produto comentario" do
    sign_in @admin
    patch produto_comentario_url(@produto, @comentario), params: {comentario: {produto_id: @comentario.produto_id, texto: @comentario.texto, titulo: @comentario.titulo, usuario_id: @comentario.usuario_id}}
    assert_redirected_to produto_url(@produto)
  end

  test "should update comentario comentario" do
    sign_in @admin
    patch comentario_comentario_url(@comentario, @comentario2), params: {comentario: {comentario_id: @comentario2.id, texto: @comentario2.texto, titulo: @comentario2.titulo, usuario_id: @comentario2.usuario_id}}
    assert_redirected_to produto_url(@produto)
  end

  test "should destroy produto comentario" do
    sign_in @admin
    assert_difference('Comentario.count', -2) do
      delete produto_comentario_url(@produto, @comentario)
    end

    assert_redirected_to produto_url(@produto)
  end

  test "should destroy comentario comentario" do
    sign_in @admin
    assert_difference('Comentario.count', -1) do
      delete comentario_comentario_url(@comentario, @comentario2)
    end

    assert_redirected_to produto_url(@produto)
  end
end
