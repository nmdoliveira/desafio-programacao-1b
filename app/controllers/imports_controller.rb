class ImportsController < ApplicationController
  helper_method :import_form, :imports

  attr_reader :import

  def create
    if import_form.valid? && import! && import.success?
      flash[:message] = "Arquivo importado com sucesso!"
    else
      flash[:message] = "Houve um erro ao processar seu arquivo: #{errors}"
    end

    redirect_to root_path
  end

  private

  def errors
    import.present? ? import.message : import_form.error_sentence
  end

  def import!
    @import = Import.create
    Importer.call(import: import, data: import_form.content)
  end

  def imports
    @imports ||= Import.order(created_at: :desc)
  end

  def import_form
    @import_form ||= ImportForm.new(params[:import_form])
  end
end
