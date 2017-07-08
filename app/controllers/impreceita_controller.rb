class ImpreceitaController < ApplicationController

  def show
    @receita = Receita.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do
        pdf = Prawn::Document.new
        pdf.font_size = 12
        pdf.draw_text "Printed on: ", at: [0, 670]
        pdf.draw_text "Receiving Worksheet", at: [220, 670]
        pdf.draw_text "Page 1", at: [480, 670]
        send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
      end
    end

  end

end
