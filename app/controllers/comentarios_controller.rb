class ComentariosController < ApplicationController
  before_action :set_comentario, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin, only: [:edit, :update, :destroy]
  before_action :authenticate_user, only: [:edit, :create, :update, :destroy]

  # GET /comentarios/1
  # GET /comentarios/1.json
  def show
  end

  # GET /comentarios/new
  def new
    @produto = Produto.find(params[:produto_id])
    @comentario = @produto
  end

  # GET /comentarios/1/edit
  def edit
  end

  # POST /comentarios
  # POST /comentarios.json
  def create
    @produto = Produto.find(params[:produto_id])
    @comentario = @produto.comentarios.create(comentario_params)
    @comentario.usuario = current_usuario
    respond_to do |format|
      if @comentario.save
        format.html { redirect_to @produto, notice: 'Comentario was successfully created.' }
        format.json { render :show, status: :created, location: @produto }
      else
        format.html { render :new }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comentarios/1
  # PATCH/PUT /comentarios/1.json
  def update
    respond_to do |format|
      if @comentario.update(comentario_params)
        format.html { redirect_to produto_path(@produto), notice: 'Comentario was successfully updated.' }
        format.json { render :show, status: :ok, location: @comentario }
      else
        format.html { render :edit }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comentarios/1
  # DELETE /comentarios/1.json
  def destroy
    @comentario.destroy
    respond_to do |format|
      format.html { redirect_to produto_path(@produto), notice: 'Comentario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comentario
      @produto = Produto.find(params[:produto_id])
      @comentario = @produto.comentarios.find(params[:id])
    end

  def authenticate_admin
    unless current_usuario.try(:admin?)
      redirect_to produto_url
    end
  end

  def authenticate_user
    unless current_usuario
      redirect_to produto_url
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comentario_params
      params.require(:comentario).permit(:titulo, :texto)
    end
end
