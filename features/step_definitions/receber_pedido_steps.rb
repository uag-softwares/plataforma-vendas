And("O usuario de nome {string} efetuou o pedido do produto de codigo {int}") do |_nomeUser, codigoProduto|
  click_button 'adicionarAoCarrinho'
  expect(page).to have_text(codigoProduto)
  click_button 'finalizarPedidoUser'
  expect(page).to have_text('efetuado')
  expect(page).to have_text(codigoProduto)
end

And("Eu estou na pagina dos pedidos") do
  visit '/pedidos'
  expect(page).to have_text('Pedidos')
end

When("Eu clico na opcao visualizar pedido do usuario de nome {string}") do |user|
  click_link "ShowPedido-#{user}"
end

Then("Eu vejo que o pedido foi recebido com sucesso") do
  expect(page).to have_text('efetuado')
end

When("Eu entro na pagina dos pedidos") do
  visit '/pedidos'
end

Then('Eu consigo visualizar todos os pedidos efetuados') do
  expect(page).to have_text('Pedidos')
end

And("Eu clico na opcao aceitar pedido") do
  click_button 'aceitarPedido'
  expect(page).to have_text('aprovado')
end

Then("Eu vejo que o pedido foi aceito com sucesso") do
  expect(page).to have_text('aprovado')
end

And("Eu clico na opcao recusar pedido") do
  click_button 'cancelarPedido'
end

Then("Eu vejo que o pedido foi cancelado com sucesso") do
  expect(page).to have_text('cancelado')
end

And("Eu clico na opcao reabrir pedido") do
  click_button 'refazerPedido'
end

Then("Eu vejo que o pedido foi reaberto com sucesso") do
  expect(page).to have_text('efetuado')
end