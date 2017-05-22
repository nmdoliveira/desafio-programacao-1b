RSpec.describe ImportDecorator do
  let(:import) do
    double :import, total: 2550,
      created_at: Time.zone.local(2017, 5, 20, 17, 38)
  end

  subject { described_class.new(import) }

  describe "#created_at" do
    it "formats date" do
      expect(subject.created_at).to eq "20/05/2017 17:38"
    end
  end

  describe "#total" do
    it "formats total" do
      expect(subject.total).to eq "R$ 25,50"
    end
  end
end
