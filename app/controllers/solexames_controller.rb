class SolexamesController < ApplicationController
  before_filter :ler_pacientes, :only => [:new, :edit ]
  before_filter :ler_exames, :only => [:new, :create, :edit, :update]
  before_filter :ler_clinicas_laboratorios, :only => [:new, :create, :edit, :update]
  before_action :set_solexame, only: [:show, :edit, :update, :destroy, :export]

  add_breadcrumb "Home" , :root_path
  add_breadcrumb "Solexames", :receitas_path

  # GET /solexames
  # GET /solexames.xml
  def index
    @solexames = Solexame.paginate(:page => params[:page])
                         .order('id desc')
  end

  # GET /solexames/1
  # GET /solexames/1.xml
  def show
    add_breadcrumb "show", solexames_path, :title => "Volta para o index"
  end

  # GET /solexames/new
  # GET /solexames/new.xml
  def new
    @solexame = Solexame.new(data: Date.today, paciente_id: @paciente.id)
    @solexame.solexameis.build
    #2.times { @solexame.solexameis.build }
    add_breadcrumb "Novo", solexames_path, :title => "Volta para o index"
  end

  # GET /solexames/1/edit
  def edit
    add_breadcrumb "Editar", solexames_path, :title => "Volta para o index"
  end

  # POST /solexames
  # POST /solexames.xml
  def create
    @solexame = Solexame.new(solexame_params)

    respond_to do |format|
      if @solexame.save
        flash[:notice] = 'Solicitação foi criado com sucesso.'
        format.html { redirect_to(@solexame) }
        format.xml  { render :xml => @solexame, :status => :created, :location => @solexame }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @solexame.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /solexames/1
  # PUT /solexames/1.xml
  def update
    respond_to do |format|
      if @solexame.update(solexame_params)
        flash[:notice] = 'Solicitação foi alterada com sucesso.'
        format.html { redirect_to(@solexame) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @solexame.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /solexames/1
  # DELETE /solexames/1.xml
  def destroy
    @solexame.destroy

    respond_to do |format|
      format.html { redirect_to paciente_url(@solexame.paciente) }
      format.xml  { head :ok }
    end
  end

  def export
    solexame_pdf = ImpressaoSolexame.new(@solexame).prepare_for_print
    send_data solexame_pdf.render, filename: "solexame.pdf", type: "application/pdf"
  end

  private

  def set_solexame
    @solexame = Solexame.find(params[:id])
  end

  def ler_pacientes
    @paciente = Paciente.find( params['paciente'] )
  end

  def ler_exames
    @exames = Exame.order(:descricao).collect { |c| [c.descricao, c.id] }
  end

  def ler_clinicas_laboratorios
    @clilabs = Clilab.all.collect { |c| [c.nm, c.id] }
  end

  def solexame_params
    params.require(:solexame).permit(:paciente_id, :data, :clilab_id, solexameis_attributes: [ :id, :exame_id, :obs, :_destroy ])
  end

end
