RSpec.describe Importer do
  describe ".call" do
    let(:import) { double :import }

    let(:data) { File.read Rails.root.join("spec/support/files/dados.txt") }
    let(:columns) { %i(client description unit_price amount address supplier) }
    let(:rows) do
      [
        [
          "João Silva",
          "R$10 off R$20 of food",
          1000,
          2,
          "987 Fake St",
          "Bob's Pizza"
        ],
        [
          "Amy Pond",
          "R$30 of awesome for R$10",
          1000,
          5,
          "456 Unreal Rd",
          "Tom's Awesome Shop"
        ],
        [
          "Marty McFly",
          "R$20 Sneakers for R$5",
          500,
          1,
          "123 Fake St",
          "Sneaker Store Emporium"
        ],
        [
          "Snake Plissken",
          "R$20 Sneakers for R$5",
          500,
          4,
          "123 Fake St",
          "Sneaker Store Emporium"
        ]
      ]
    end

    context "when import is succesful" do
      it "creates orders" do
        expect(import).to receive_message_chain(:orders, :import!)
          .with(columns, match(rows))
        expect(import).to receive(:success!)

        described_class.call(import: import, data: data)
      end
    end

    context "when import fails" do
      it "saves failure on import" do
        expect(import).to receive_message_chain(:orders, :import!)
          .and_raise("some error")
        expect(import).to receive(:fail!).with(message: "some error")

        described_class.call(import: import, data: data)
      end
    end
  end
end
