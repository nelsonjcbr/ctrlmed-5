class ReceitasController < ApplicationController
  before_filter :ler_paciente, :only => [:new, :edit ]
  before_filter :ler_medicamentos, :only => [:new, :create, :edit, :update]
  before_action :set_receita, only: [:show, :edit, :update, :destroy, :export]

  add_breadcrumb "Home" , :root_path
  add_breadcrumb "Receitas", :receitas_path

    # GET /receitas
  # GET /receitas.xml
  def index
    @totalreceitas = Receita.count
    @receitas = Receita.paginate(:page => params[:page])
                         .order('id desc')
  end

  # GET /receitas/1
  # GET /receitas/1.xml
  def show
    add_breadcrumb "show", receitas_path, :title => "Volta para o index"
  end

  # GET /receitas/new
  # GET /receitas/new.xml
  def new
    @receita = Receita.new(data: Date.today, paciente_id: @paciente.id)
    @receita.receitais.build
    #2.times { @receita.receitais.build }
    add_breadcrumb "Novo", receitas_path, :title => "Volta para o index"
  end

  # GET /receitas/1/edit
  def edit
    add_breadcrumb "Editar", receitas_path, :title => "Volta para o index"
  end

  # POST /receitas
  # POST /receitas.xml
  def create
    @receita = Receita.new(receita_params)
    respond_to do |format|
      if @receita.save
        flash[:notice] = 'Receita was successfully created.'
        format.html { redirect_to(@receita) }
        format.xml  { render :xml => @receita, :status => :created, :location => @receita }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @receita.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /receitas/1
  # PUT /receitas/1.xml
  def update
    respond_to do |format|
      if @receita.update(receita_params)
        flash[:notice] = 'Receita was successfully updated.'
        format.html { redirect_to(@receita) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @receita.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /receitas/1
  # DELETE /receitas/1.xml
  def destroy
    @receita.destroy
    respond_to do |format|
      format.html { redirect_to paciente_url(@receita.paciente_id) }
      format.json { head :no_content }
    end
  end

  def export
    receita_pdf = ImpressaoReceita.new(@receita).prepare_for_print
    send_data receita_pdf.render, filename: "receita.pdf", type: "application/pdf"
  end

def get_doses2
   @med = Medicamento.find( params[:medicamento_id], :select => 'dose' )
#   render :inline => "<%= receitai_form.text_field :dose %>"
   render :inline => "<%= text_field :receitai, :dose, 'tt' %>"
 end
 def get_doses
   @doses = Medicamento.all( :conditions => {:id => params[:medicamento_id]}).collect {|c| [c.dose]}
  render :inline => "<%= @doses %>"
#   render :inline =>  '<%= receitai_form.select :dose, "Todos"  %>'
#   render :inline => "<%= select :receitai[], :dose, options_for_select(@doses) %>"
 end

  private

  def ler_paciente
    @paciente = Paciente.find( params['paciente'] )
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_receita
    @receita = Receita.find(params[:id])
  end

  def ler_medicamentos
    @medicamentos = Medicamento.order(:descricao).collect { |c| [c.descricao, c.id] }
  end

  def receita_params
    params.require(:receita).permit(:paciente_id, :data, receitais_attributes: [ :id, :medicamento_id, :dose, :qtde, :_destroy ])
  end

end
