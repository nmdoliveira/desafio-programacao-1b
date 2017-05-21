require "rails_helper"

RSpec.describe ImportOrders do
  describe ".call" do
    let(:import) { double :import }
    let(:orders) { double :orders }

    let(:data) { File.read Rails.root.join("spec/support/files/dados.txt") }
    let(:parsed) do
      [
        {
          client: "João Silva",
          description: "R$10 off R$20 of food",
          unit_price: 1000,
          amount: 2,
          address: "987 Fake St",
          supplier: "Bob's Pizza"
        },
        {
          client: "Amy Pond",
          description: "R$30 of awesome for R$10",
          unit_price: 1000,
          amount: 5,
          address: "456 Unreal Rd",
          supplier: "Tom's Awesome Shop"
        },
        {
          client: "Marty McFly",
          description: "R$20 Sneakers for R$5",
          unit_price: 500,
          amount: 1,
          address: "123 Fake St",
          supplier: "Sneaker Store Emporium"
        },
        {
          client: "Snake Plissken",
          description: "R$20 Sneakers for R$5",
          unit_price: 500,
          amount: 4,
          address: "123 Fake St",
          supplier: "Sneaker Store Emporium"
        }
      ]
    end

    it "creates orders" do
      expect(Import).to receive(:create!).and_return(import)
      expect(Order).to receive(:create!).with(parsed).and_return(orders)
      expect(import).to receive_message_chain(:orders, :<<).with(orders)

      described_class.call(data: data)
    end
  end
end
