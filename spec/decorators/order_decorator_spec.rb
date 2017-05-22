RSpec.describe OrderDecorator do
  let(:order) { double :order, unit_price: 1999 }

  subject { described_class.new(order) }

  describe "#unit_price" do
    it "formats price" do
      expect(subject.unit_price).to eq "R$ 19,99"
    end
  end
end
