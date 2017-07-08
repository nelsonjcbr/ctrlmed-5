class Receita < ApplicationRecord
  #acts_as_reportable

  belongs_to :paciente
  has_many :receitais, dependent: :destroy, inverse_of: :receita

  accepts_nested_attributes_for :receitais,
          reject_if: proc { |attributes| attributes['medicamento_id'].blank? },
          allow_destroy: true

end
