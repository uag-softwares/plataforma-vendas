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
    @novo_comentario = Comentario.new produto_id: @comentario.produto_id, texto: @comentario.texto, titulo: @comentario.titulo, usuario_id: @comentario.usuario_id
  end

  def get_new(url)
    sign_in @admin
    get url
    assert_response :success
  end

  def post_create(url, param)
    sign_in @admin
    assert_difference('Comentario.count') do
      post url, params: param
    end

    assert_redirected_to produto_url(@produto)
  end

  def get_edit(url)
    sign_in @admin
    get url
    assert_response :success
  end

  def update(url, param)
    sign_in @admin
    patch url, params: param
    assert_redirected_to produto_url(@produto)
  end

  test "should get new produto comentario" do
    get_new new_produto_comentario_url(@produto)
  end

  test "should get new comentario comentario" do
    get_new new_comentario_comentario_url(@comentario)
  end

  test "should create produto comentario" do
    post_create produto_comentarios_url(@produto), {comentario: {produto_id: @comentario.produto_id, texto: @comentario.texto, titulo: @comentario.titulo, usuario_id: @comentario.usuario_id}}
  end

  test "should create comentario comentario" do
    post_create comentario_comentarios_url(@comentario), {comentario: {comentario_id: @comentario.id, texto: @comentario2.texto, titulo: @comentario2.titulo, usuario_id: @comentario2.usuario_id}}
  end

  test "should get edit produto comentario" do
    get_edit edit_produto_comentario_url(@produto, @comentario)
  end

  test "should get edit comentario comentario" do
    get_edit edit_comentario_comentario_url(@comentario, @comentario2)
  end

  test "should update produto comentario" do
    update produto_comentario_url(@produto, @comentario), {comentario: {produto_id: @comentario.produto_id, texto: @comentario.texto, titulo: @comentario.titulo, usuario_id: @comentario.usuario_id}}
  end

  test "should update comentario comentario" do
    update comentario_comentario_url(@comentario, @comentario2), {comentario: {comentario_id: @comentario2.id, texto: @comentario2.texto, titulo: @comentario2.titulo, usuario_id: @comentario2.usuario_id}}
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
