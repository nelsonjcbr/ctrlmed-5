class Medicamento < ActiveRecord::Base
  belongs_to :viaaplic

  def to_s
    descricao
  end
  
end
