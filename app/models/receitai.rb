class Receitai < ActiveRecord::Base
  #acts_as_reportable

  validates :medicamento_id, presence: true
  validates :dose, presence: true

  belongs_to :receita
  belongs_to :medicamento

  before_create :atualiza_dose

  def medicamento_descricao
    self.medicamento.try(:descricao)
  end

  def atualiza_dose
    if self.dose.nil? || self.dose == ''
      @med = Medicamento.find( self.medicamento_id )
      self.dose = @med.dose
    end
  end

end
