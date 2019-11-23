module Helper
  def a_pagina_deve_conter(*args)
    args.each do |arg|
      expect(page).to have_text arg
    end
  end
end