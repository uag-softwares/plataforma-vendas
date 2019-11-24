module HelperTest
  def deve_salvar_apenas_um(objeto)
    assert_difference("#{objeto.class.name}.count") do
      assert objeto.save
    end
  end
end