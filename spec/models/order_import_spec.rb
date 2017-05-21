require "rails_helper"

RSpec.describe OrderImport do
  it { is_expected.to belong_to :order }
  it { is_expected.to belong_to :import }
end
