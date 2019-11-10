And("Eu efetuo o pedido de codigo {string} da compra do produto de codigo {int}") do |codigoPedido, codigoProduto|
  click_button 'adicionarAoCarrinho'
  expect(page).to have_text('Seu carrinho')
  click_button 'finalizarPedido'
  expect(page).to have_text(codigoPedido)
  expect(page).to have_text(codigoProduto)
end

When("Eu entro na pagina do pedido de codigo {string}") do |codigoPedido|
  visit '/pedidos'
  expect(page).to have_text('Pedidos')
  click_link 'ShowPedido'
  expect(page).to have_text(codigoPedido)
end

Then("Eu vejo que o pedido de codigo {string} foi recebido com sucesso") do |codigoPedido|
  expect(page).to have_current_path('/pedidos/'+codigoPedido)
  expect(page).to have_text('efetuado')
end