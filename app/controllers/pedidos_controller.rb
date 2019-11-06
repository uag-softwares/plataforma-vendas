class PedidosController < ApplicationController
  load_and_authorize_resource

  # GET /pedidos
  # GET /pedidos.json
  def index
    @pedidos = Pedido.all
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new
  end

  # GET /pedidos/1/edit
  def edit
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new

    respond_to do |format|
      if @pedido.save
        format.html { redirect_to @pedido, notice: 'Pedido was successfully created.' }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    update_param(@pedido, pedido_params)
  end

  def efetuar
    update_param(@pedido, status: :efetuado)
  end

  def cancelar
    update_param(@pedido, status: :cancelado)
  end
  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: 'Pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def update_param(pedido, params)
    respond_to do |format|
      if pedido.update(params)
        format.html { redirect_to pedido, notice: 'Pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: pedido }
      else
        format.html { render :edit }
        format.json { render json: pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
    def pedido_params
      params.require(:pedido).permit(:status)
    end
end
