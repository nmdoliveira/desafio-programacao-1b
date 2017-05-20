require "rails_helper"

RSpec.describe ImportsController do
  describe "POST create" do
    let(:file) { "file" }
    let(:form) { double :form }

    before do
      allow(ImportForm).to receive(:new).with(file: file).and_return(form)
    end

    context "when parameters are valid" do
      before { allow(form).to receive(:valid?).and_return(true) }

      it do
        post :create, import_form: { file: file }
        expect(response.body).to eq "Arquivo válido"
      end
    end

    context "when parameters are invalid" do
      before { allow(form).to receive(:valid?).and_return(false) }

      it do
        post :create, import_form: { file: file }
        expect(response.body).to eq "Arquivo inválido"
      end
    end
  end
end
