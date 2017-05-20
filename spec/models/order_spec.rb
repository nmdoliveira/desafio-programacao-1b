require "rails_helper"

RSpec.describe Order do
  it { is_expected.to validate_presence_of :client }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :unit_price }
  it { is_expected.to validate_presence_of :amount }
  it { is_expected.to validate_presence_of :address }
  it { is_expected.to validate_presence_of :supplier }

  it { is_expected.to validate_numericality_of :unit_price }
  it { is_expected.to validate_numericality_of :amount }
end
