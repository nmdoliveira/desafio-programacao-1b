class ImportsController < ApplicationController
  helper_method :import_form

  def create
    if import_form.valid?
      ImportOrders.call(content: import_form.content)
      redirect_to orders_path
    else
      render :new
    end
  end

  private

  def import_form
    @import_form ||= ImportForm.new(params[:import_form])
  end
end
