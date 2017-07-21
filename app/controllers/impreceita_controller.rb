class ImpreceitaController < ApplicationController

  def show
    @receita = Receita.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do
        pdf = Prawn::Document.new(:page_size => "A5") # http://prawnpdf.org/docs/0.11.1/Prawn/Document/PageGeometry.html
        pdf.font_size = 12

        pdf.draw_text @receita.paciente.nm_paciente, :at => [0, 400]
      
        y = 300
        @receita.receitais.each do |i|
          pdf.draw_text i.medicamento.viaaplic.descricao, :at => [0, y+15]
          pdf.draw_text i.medicamento.descricao, :at => [20, y]
          pdf.draw_text i.qtde, :at => [300, y]
          pdf.draw_text i.dose, :at => [30, y-15]
          y -=45
        end

        mes =    case @receita.data.month
            when 1
                'Janeiro'
            when 2
                'Fevereiro'
            when 3
                'Março'
            when 4
                'Abril'
            when 5
                'Maio'
            when 6
                'Junho'
            when 7
                'Julho'
            when 8
                'Agosto'
            when 9
                'Setembro'
            when 10
                'Outubro'
            when 11
                'Novembro'
            when 12
                'Dezembro'
            end

        pdf.draw_text 'Joaçaba, ' + @receita.data.day.to_s + ' de ' + mes + ' de ' + @receita.data.year.to_s + '.', at: [0, 10]
        send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
      end
    end

  end

end
