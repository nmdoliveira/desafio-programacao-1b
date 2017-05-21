class ImportsController < ApplicationController
  helper_method :import_form, :imports

  def create
    if import_form.valid?
      ImportOrders.call(data: import_form.content)
      flash.now[:message] = "Arquivo importado com sucesso!"
    else
      flash.now[:message] = "Houve um erro ao processar seu arquivo: #{errors}"
    end

    render :index
  end

  private

  def errors
    import_form.error_sentence
  end

  def imports
    @imports ||= Import.order(created_at: :desc)
  end

  def import_form
    @import_form ||= ImportForm.new(params[:import_form])
  end
end
