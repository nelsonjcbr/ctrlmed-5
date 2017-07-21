class ReceitaisController < ApplicationController
  before_filter :set_receita, :only => [:new, :edit, :create, :update ]
  before_action :set_receitai, only: [:edit, :update, :destroy]

  add_breadcrumb "Home" , :root_path
  add_breadcrumb "Item", :receitas_path

  # GET /receitais/new
  def new
    @receitai = @receita.receitais.build
  end

  # GET /receitais/1/edit
  def edit
  end

  # POST /receitais
  # POST /receitais.json
  def create
    @receitai = @receita.receitais.build(receitai_params)
    respond_to do |format|
      if @receitai.save
        format.html { redirect_to proc { new_receita_receitai_url(@receita)}, notice: 'Incluido item na receita.' }
  #      format.html { redirect_back fallback_location: proc { new_receita_receitai_url(@receita) }, notice: 'Incluido item na receita.' }
        format.json { render :show, status: :created, location: @receitai }
      else
        format.html { render :new }
        format.json { render json: @receitai.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receitais/1
  # PATCH/PUT /receitais/1.json
  def update
    respond_to do |format|
      if @receitai.update(receitai_params)
        format.html { redirect_to proc { receita_url(@receita) }, notice: 'Item foi alterado.' }
        format.json { render :show, status: :ok, location: @receitai }
      else
        format.html { render :edit }
        format.json { render json: @receitai.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receitais/1
  # DELETE /receitais/1.json
  def destroy
    @receitai.destroy
    respond_to do |format|
      format.html { redirect_to proc { receita_url(@receita)}, notice: 'Item excluido.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receitai
      @receitai = Receitai.find(params[:id])
    end

    def set_receita
      @receita = Receita.find(params[:receita_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receitai_params
      params.require(:receitai).permit(:receita_id, :id, :medicamento_id, :dose, :qtde)
    end

end
