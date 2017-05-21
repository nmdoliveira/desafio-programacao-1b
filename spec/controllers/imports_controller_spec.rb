require "rails_helper"

RSpec.describe ImportsController do
  describe "POST create" do
    let(:file) { "file" }
    let(:form) { double :form, content: "data" }

    before do
      allow(ImportForm).to receive(:new).with(file: file).and_return(form)
    end

    context "when parameters are valid" do
      before do
        allow(form).to receive(:valid?).and_return(true)
      end

      it "imports orders" do
        expect(ImportOrders).to receive(:call).with(data: "data")

        post :create, import_form: { file: file }

        expect(response).to render_template :index
        expect(flash[:message]).to eq "Arquivo importado com sucesso!"
      end
    end

    context "when parameters are invalid" do
      before do
        allow(form).to receive(:valid?).and_return(false)
        allow(form).to receive(:error_sentence).and_return("x")
      end

      it do
        post :create, import_form: { file: file }

        expect(response.body).to render_template :index
        expect(flash[:message])
          .to eq "Houve um erro ao processar seu arquivo: x"
      end
    end
  end
end
