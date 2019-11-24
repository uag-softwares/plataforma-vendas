class PedidosController < ApplicationController
  load_and_authorize_resource :pedido

  # GET /pedidos
  # GET /pedidos.json
  def index
    @pedidos = @pedidos.where.not(status: :criando)
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
  end

  # GET /pedidos/1/edit
  def edit
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    update_param(pedido_params)
  end

  def efetuar
    update_param(status: :efetuado)
  end

  def cancelar
    respond_to do |format|
      if @pedido.cancelar_pedido
        response_successfully(format, @pedido, 'Pedido was successfully updated.', :show, :ok)
      else
        response_unsuccessfully(format, :edit, @pedido, :unprocessable_entity)
      end
    end
  end

  def aceitar
    respond_to do |format|
      begin
        @pedido.aceitar_pedido
        response_successfully(format, @pedido, 'Pedido was successfully updated.', :show, :ok)
      rescue => exception
        format.json { head :forbidden }
        format.html { redirect_to @pedido, :alert => exception.message }
      end
    end
  end

  def finalizar
    update_param(status: :entregue)
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido.destroy
    respond_to do |format|
      response_successfully(format, pedidos_url, 'Pedido was successfully destroyed.', :show, :no_content)
    end
  end

  private

  def update_param(params)
    respond_to do |format|
      if @pedido.update(params)
        response_successfully(format, @pedido, 'Pedido was successfully updated.', :show, :ok)
      else
        response_unsuccessfully(format, :edit, @pedido, status: :unprocessable_entity)
      end
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pedido_params
    params.require(:pedido).permit(:status, :usuario)
  end
end
