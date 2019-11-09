require 'test_helper'

class PedidosControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @pedido = pedidos(:pedido_um)
    @usuario = usuarios(:usuario_dois)
  end

  test "should get index" do
    sign_in @usuario
    get pedidos_url
    assert_response :success
  end

  test "should show pedido" do
    sign_in @usuario
    get pedido_url(@pedido)
    assert_response :success
  end

  test "should get edit" do
    sign_in @usuario
    get edit_pedido_url(@pedido)
    assert_response :success
  end

  test "should update pedido" do
    sign_in @usuario
    patch pedido_url(@pedido), params: { pedido: { pedido_id: @pedido.id, status: :efetuado } }
    assert_redirected_to pedido_url(@pedido)
  end

  test "should destroy pedido" do
    sign_in @usuario
    # muda 0, porque ele apaga um, mas quando faz login cria outro
    assert_difference('Pedido.count', 0) do
      delete pedido_url(@pedido)
    end

    assert_redirected_to pedidos_url
  end
end