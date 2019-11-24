class ProdutosController < ApplicationController
  load_and_authorize_resource

  # GET /produtos
  # GET /produtos.json
  def index
    @produtos = Produto.all
  end

  # GET /produtos/1
  # GET /produtos/1.json
  def show
  end

  # GET /produtos/new
  def new
    @produto = Produto.new
  end

  # GET /produtos/1/edit
  def edit
  end

  # POST /produtos
  # POST /produtos.json
  def create
    @produto = Produto.new(produto_params)

    respond_to do |format|
      if @produto.save
        response_successfully(format, @produto, 'Produto was successfully created.', :show, :created)
      else
        response_unsuccessfully(format, :new, @produto, :unprocessable_entity)
      end
    end
  end

  # PATCH/PUT /produtos/1
  # PATCH/PUT /produtos/1.json
  def update
    respond_to do |format|
      if @produto.update(produto_params)
        response_successfully(format, @produto, 'Produto was successfully updated.', :show, :ok)
      else
        response_unsuccessfully(format, :edit, @produto, :unprocessable_entity)
      end
    end
  end

  # DELETE /produtos/1
  # DELETE /produtos/1.json
  def destroy
    respond_to do |format|
      @produto.destroy
      response_successfully(format, produtos_url, 'Produto was successfully destroyed.', :show, :no_content)
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def produto_params
    params.require(:produto).permit(:codigo, :nome, :marca, :quantidade_estoque, :preco)
  end
end
