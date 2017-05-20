class ImportsController < ApplicationController
  helper_method :import_form

  def create
    if import_form.valid?
      render text: "Arquivo válido"
    else
      render text: "Arquivo inválido"
    end
  end

  private

  def import_form
    @import_form ||= ImportForm.new(params[:import_form])
  end
end
