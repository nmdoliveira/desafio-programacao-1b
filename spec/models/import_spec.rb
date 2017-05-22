require "rails_helper"

RSpec.describe Import do
  it { is_expected.to have_many :orders }

  describe "#total" do
    let(:order_1) { build :order, amount: 2, unit_price: 100 }
    let(:order_2) { build :order, amount: 3, unit_price: 2500 }

    subject { build :import }

    before do
      subject.orders << [order_1, order_2]
    end

    it "sums orders totals" do
      expect(subject.total).to eq 7700
    end
  end
end
