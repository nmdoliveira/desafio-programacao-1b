class ImportForm
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :file

  validates :file, :content, presence: true

  def content
    @content ||= file.present? && file.read
  end
end
