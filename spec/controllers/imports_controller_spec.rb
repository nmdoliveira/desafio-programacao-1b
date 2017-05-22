RSpec.describe ImportsController do
  describe "POST create" do
    let(:file) { "file" }
    let(:import) { double :import }
    let(:form) { double :form, content: "data" }

    before do
      allow(Import).to receive(:create).and_return(import)
      allow(ImportForm).to receive(:new).with(file: file).and_return(form)
    end

    context "when import is succesful" do
      before do
        allow(form).to receive(:valid?).and_return(true)
        allow(import).to receive(:success?).and_return(true)
      end

      it "imports orders" do
        expect(Importer).to receive(:call).with(import: import, data: "data")
          .and_return(true)

        post :create, import_form: { file: file }

        expect(response).to redirect_to "/"
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

        expect(response.body).to redirect_to "/"
        expect(flash[:message])
          .to eq "Houve um erro ao processar seu arquivo: x"
      end
    end
  end
end
