class ComentariosController < ApplicationController
  before_action :set_comentavel
  before_action :set_comentario, only: [:edit, :update, :destroy]
  before_action :authenticate_user, only: [:edit, :update, :destroy]
  before_action :authenticate_logged_user, only: [:create]

  # GET /comentarios/1/edit
  def edit
  end

  def produto
    if @comentavel.class.name == "Produto"
      @comentavel
    else
      @comentavel.raiz
    end
  end

  helper_method :produto

  def new
    if @comentario == nil
      @comentario = Comentario.new
    end
  end

  def show
  end

  # POST /comentarios
  # POST /comentarios.json
  def create
    @comentario = @comentavel.comentarios.create(comentario_params)
    @comentario.usuario = current_usuario
    respond_to do |format|
      if @comentario.save
        format.html { redirect_to produto, notice: 'Comentario was successfully created.' }
        format.json { render :new, status: :created, location: @comentavel }
      else
        format.html { render :new }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comentarios/1
  # PATCH/PUT /comentarios/1.json
  def update
    if current_usuario.admin || @comentario.usuario == current_usuario
      respond_to do |format|
        if @comentario.update(comentario_params)
          format.html { redirect_to produto, notice: 'Comentario was successfully updated.' }
          format.json { render :new, status: :ok, location: @comentario }
        else
          format.html { render :edit }
          format.json { render json: @comentario.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /comentarios/1
  # DELETE /comentarios/1.json
  def destroy
    if current_usuario.admin || @comentario.usuario == current_usuario
      @comentario.destroy
      respond_to do |format|
        format.html { redirect_to request.referrer, notice: 'Comentario was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comentario
    @comentario = @comentavel.comentarios.find(params[:id])
  end

  def set_comentavel
    if params[:comentario_id]
      @comentavel = Comentario.find(params[:comentario_id])
    elsif params[:produto_id]
      @comentavel = Produto.find(params[:produto_id])
    end
  end

  def set_produto
    @produto = @comentavel
  end

  def authenticate_user
    unless current_usuario.try(:admin?) || @comentario.usuario == current_usuario
      redirect_to produto_url
    end
  end

  def authenticate_logged_user
    unless current_usuario
      redirect_to produto_url
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comentario_params
    params.require(:comentario).permit(:titulo, :texto)
  end
end
