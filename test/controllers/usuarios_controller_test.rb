require 'test_helper'

class UsuariosControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin = usuarios(:usuario_um)
    @usuario = usuarios(:usuario_dois)
  end
end
