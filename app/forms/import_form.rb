class ImportForm
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :file

  validates :file, presence: true
  validate :file_has_content

  def content
    @content ||= file.present? && file.read
  end

  def error_sentence
    errors.messages.values.flatten.to_sentence
  end

  private

  def file_has_content
    errors.add :file, "o arquivo está vazio"
  end
end
