And("O usuario de nome {string} efetuou o pedido do produto de codigo {int}") do |nomeUser, codigoProduto|
  visit '/pedidos'
  click_link "ShowPedido-#{nomeUser}"
  a_pagina_deve_conter 'efetuado', codigoProduto, nomeUser
end

And("Eu estou na pagina dos pedidos") do
  visit '/pedidos'
  a_pagina_deve_conter 'Pedidos'
end

When("Eu clico na opcao visualizar pedido do usuario de nome {string}") do |user|
  click_link "ShowPedido-#{user}"
end

Then("Eu vejo que o pedido foi recebido com sucesso") do
  a_pagina_deve_conter 'efetuado'
end

When("Eu entro na pagina dos pedidos") do
  visit '/pedidos'
end

Then('Eu consigo visualizar todos os pedidos efetuados') do
  a_pagina_deve_conter 'Pedidos'
end

And("Eu clico na opcao aceitar pedido") do
  click_button 'aceitarPedido'
  a_pagina_deve_conter 'aprovado'
end

Then("Eu vejo que o pedido foi aceito com sucesso") do
  a_pagina_deve_conter 'aprovado'
end

And("Eu clico na opcao recusar pedido") do
  click_button 'cancelarPedido'
end

Then("Eu vejo que o pedido foi cancelado com sucesso") do
  a_pagina_deve_conter 'cancelado'
end

And("Eu clico na opcao reabrir pedido") do
  click_button 'refazerPedido'
end

Then("Eu vejo que o pedido foi reaberto com sucesso") do
  a_pagina_deve_conter 'efetuado'
end