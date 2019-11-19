class ItemsController < ApplicationController
  load_and_authorize_resource :pedido
  load_and_authorize_resource :item, through: :pedido

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @produto = Produto.find(item_params[:produto_id])
    @item = @current.add_produto(@produto)

    respond_to do |format|
      if @item.save
        response_successfully(format, @current, 'Item was successfully created.', :show, :created)
      else
        response_unsuccessfully(format, :new, @current, :unprocessable_entity)
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        response_successfully(format, @pedido, 'Item was successfully updated.', :show, :ok)
      else
        response_unsuccessfully(format, :edit, @pedido, :unprocessable_entity)
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      response_successfully(format, @pedido, 'Item was successfully created.', :show, :no_content)
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:quantidade, :produto_id, :pedido_id)
    end
end
