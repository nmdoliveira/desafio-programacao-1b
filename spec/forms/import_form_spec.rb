RSpec.describe ImportForm, type: :model do
  it { is_expected.to validate_presence_of :file }

  it "validates file content" do
    subject.file = double(:file, read: "")
    expect(subject).not_to be_valid
  end

  describe "#error_sentence" do
    before do
      subject.file = double(:file, read: "")
      subject.validate
    end

    it "joins error messages" do
      expect(subject.error_sentence).to eq "o arquivo está vazio"
    end
  end
end
