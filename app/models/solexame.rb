class Solexame < ActiveRecord::Base
  belongs_to :clilab
  belongs_to :paciente
  has_many :solexameis
  accepts_nested_attributes_for :solexameis,
          reject_if: proc { |attributes| attributes['exame_id'].blank? },
          allow_destroy: true
end
