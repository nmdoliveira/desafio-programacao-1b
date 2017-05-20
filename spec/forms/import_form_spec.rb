require "rails_helper"

RSpec.describe ImportForm, type: :model do
  it { is_expected.to validate_presence_of :file }

  it "validates file content" do
    subject.file = double(:file, read: "")
    expect(subject).not_to be_valid
  end
end
