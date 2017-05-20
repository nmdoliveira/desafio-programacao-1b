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

      it "imports orders and redirects to orders apge" do
        expect(ImportOrders).to receive(:call).with(data: "data")

        post :create, import_form: { file: file }

        expect(response).to redirect_to "/orders"
      end
    end

    context "when parameters are invalid" do
      before { allow(form).to receive(:valid?).and_return(false) }

      it do
        post :create, import_form: { file: file }
        expect(response.body).to render_template :new
      end
    end
  end
end
