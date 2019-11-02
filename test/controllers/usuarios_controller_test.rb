require 'test_helper'

class UsuariosControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin = usuarios(:usuario_um)
    @usuario = usuarios(:usuario_dois)
  end

  test "should get index" do
    sign_in @admin
    get usuarios_url
    assert_response :success
  end

  test "should show usuario" do
    sign_in @admin
    get usuario_url(@usuario)
    assert_response :success
  end

  test "should update usuario" do
    sign_in @admin
    patch usuario_url(@usuario), params: {usuario: {admin: @usuario.admin, nome: @usuario.nome}}
    assert_redirected_to usuario_url(@usuario)
  end

  test "should destroy usuario" do
    sign_in @admin
    assert_difference('Usuario.count', -1) do
      delete usuario_url(@usuario)
    end

    assert_redirected_to usuarios_url
  end
end
